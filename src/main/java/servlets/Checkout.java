package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PedidoVO;
import utils.ConexionDB;

/**
 * Servlet implementation class Checkout
 */
@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		PedidoVO pedido = new PedidoVO();
		String mensaje = "";
		int id_usuario = (Integer) sesion.getAttribute("id");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		Date date = new Date();
		System.out.println(date);

		pedido.setId_usuario(id_usuario);
		pedido.setNombre(request.getParameter("nombre"));
		pedido.setApellidos(request.getParameter("apellidos"));
		pedido.setTelefono(request.getParameter("numero"));
		pedido.setEmail(request.getParameter("email"));
		pedido.setMetodo(Integer.parseInt(request.getParameter("metodo")));
		pedido.setDireccion(Integer.parseInt(request.getParameter("direccion")));
		pedido.setFecha((date));
		java.sql.Date sqlDate = new java.sql.Date(pedido.getFecha().getTime());

		Connection con;
		PreparedStatement pstm;
		ResultSet rs;

		con = ConexionDB.conectar();
		float total_carrito = 0;
		float subtotal = 0;
		ArrayList<String> productos_carrito = new ArrayList<String>();
		String total_productos = "";

		String query = "SELECT * FROM \"comprix\".carrito WHERE id_usuario= ?";
		try {
			pstm = con.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pstm.setInt(1, pedido.getId_usuario());
			rs = pstm.executeQuery();

			rs.last();
			int numberOfRows = rs.getRow();
			rs.beforeFirst();

			if (numberOfRows > 0) {
				while (rs.next()) {
					productos_carrito.add(rs.getString(4).concat("(" + rs.getInt(5) + ")"));
					subtotal = (rs.getFloat(7) * rs.getInt(5));
					total_carrito += subtotal;
				}
			}

			query = "SELECT * FROM \"comprix\".pedido WHERE nombre = ? AND apellidos = ? AND telefono = ? AND email = ? AND metodo = ? AND direccion = ? AND productos_total = ? AND precio_total = ? ";
			pstm = con.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pstm.setString(1, pedido.getNombre());
			pstm.setString(2, pedido.getApellidos());
			pstm.setString(3, pedido.getTelefono());
			pstm.setString(4, pedido.getEmail());
			pstm.setInt(5, pedido.getMetodo());
			pstm.setInt(6, pedido.getDireccion());
			pstm.setString(7, total_productos);
			pstm.setString(8, String.valueOf(total_carrito));
			rs = pstm.executeQuery();

			rs.last();
			numberOfRows = rs.getRow();
			rs.beforeFirst();

			total_productos = String.join(",", productos_carrito);
			if (total_carrito == 0) {
				mensaje = "Tu carrito está vacío.";
			} else if (numberOfRows > 0) {
				mensaje = "Ya has realizado este pedido.";
			} else {
				String sql = "INSERT INTO  \"comprix\".pedido (id_usuario,nombre,apellidos,telefono,email,metodo,direccion,productos_total,precio_total,fecha) VALUES(?,?,?,?,?,?,?,?,?,?)";
				try {
					pstm = con.prepareStatement(sql);
					pstm.setInt(1, pedido.getId_usuario());
					pstm.setString(2, pedido.getNombre());
					pstm.setString(3, pedido.getApellidos());
					pstm.setString(4, pedido.getTelefono());
					pstm.setString(5, pedido.getEmail());
					pstm.setInt(6, pedido.getMetodo());
					pstm.setInt(7, pedido.getDireccion());
					pstm.setString(8, total_productos);
					pstm.setString(9, String.valueOf(total_carrito));
					pstm.setDate(10, sqlDate);

					int i = pstm.executeUpdate();

					try {
						con.close();
						pstm.close();
					} catch (Exception e) {
						e.printStackTrace();
					}

					if (i != 0) {
						mensaje = "Pedido realizado correctamente.";
						System.out.println(mensaje);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		sesion.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher("/checkout.jsp").forward(request, response);
	}

}
