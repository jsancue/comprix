package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CarritoVO;
import utils.ConexionDB;

/**
 * Servlet implementation class ActualizarCarrito
 */
@WebServlet("/ActualizarCarrito")
public class ActualizarCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		CarritoVO carrito = new CarritoVO();
		String mensaje = "";

		carrito.setId(Integer.parseInt(request.getParameter("carrito_id")));
		carrito.setCantidad(Integer.parseInt(request.getParameter("p_cantidad")));

		Connection con;
		PreparedStatement pstm;

		con = ConexionDB.conectar();
		if (request.getParameter("actualizar_cantidad") != null) {
			String query = "UPDATE  \"comprix\".carrito SET cantidad = ? WHERE id = ?";
			try {
				pstm = con.prepareStatement(query);
				pstm.setInt(1, carrito.getCantidad());
				pstm.setInt(2, carrito.getId());

				int i = pstm.executeUpdate();

				try {
					con.close();
					pstm.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

				if (i != 0) {
					mensaje = "Cantidad del producto actualizada.";
					System.out.println(mensaje);
					sesion.setAttribute("mensaje", mensaje);
					sesion.setAttribute("eliminar", 0);
					request.getRequestDispatcher("/carrito.jsp").forward(request, response);
				}

			} catch (SQLException e) {
				e.printStackTrace();

			}
		}
	}

}
