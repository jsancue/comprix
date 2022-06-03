package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CarritoVO;
import model.WishlistVO;
import utils.ConexionDB;

/**
 * Servlet implementation class AñadirLista
 */
@WebServlet("/AñadirLista")
public class AñadirLista extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		int id = (Integer) sesion.getAttribute("id");
		CarritoVO carrito = new CarritoVO();
		WishlistVO wishlist = new WishlistVO();
		String mensaje = "";
		String sql = "";
		int numberOfRows = 0;

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		con = ConexionDB.conectar();

		if (request.getParameter("carrito") != null) {
			carrito.setId_usuario(id);
			carrito.setId_producto(Integer.parseInt(request.getParameter("pid")));
			carrito.setNombre(request.getParameter("p_nombre"));
			carrito.setPrecio(Float.parseFloat(request.getParameter("p_precio")));
			carrito.setCantidad(Integer.parseInt(request.getParameter("p_cantidad")));
			carrito.setImagen((request.getParameter("p_imagen").getBytes()));

			sql = "SELECT * FROM \"comprix\".carrito WHERE id_usuario=? AND nombre=?";
			try {
				pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pstm.setInt(1, carrito.getId_usuario());
				pstm.setString(2, carrito.getNombre());
				System.out.println(pstm);
				rs = pstm.executeQuery();

				rs.last();
				numberOfRows = rs.getRow();
				rs.beforeFirst();

				if (numberOfRows > 0) {
					mensaje = "El producto ya está añadido al carrito.";
					sesion.setAttribute("mensaje", mensaje);
					request.getRequestDispatcher("/tienda.jsp").forward(request, response);
				} else {
					sql = "SELECT * FROM \"comprix\".wishlist WHERE id_usuario=? AND nombre=?";
					pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					pstm.setInt(1, carrito.getId_usuario());
					pstm.setString(2, carrito.getNombre());
					System.out.println(pstm);
					rs = pstm.executeQuery();

					rs.last();
					numberOfRows = rs.getRow();
					rs.beforeFirst();

					if (numberOfRows > 0) {
						sql = "DELETE FROM \"comprix\".wishlist WHERE id_usuario=? AND nombre=?";
						pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
						pstm.setInt(1, carrito.getId_usuario());
						pstm.setString(2, carrito.getNombre());
						System.out.println(pstm);
						pstm.executeUpdate();
					}

					sql = "INSERT INTO \"comprix\".carrito (id_usuario,id_producto,nombre,cantidad,precio,imagen) VALUES(?,?,?,?,?,?)";
					pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					pstm.setInt(1, carrito.getId_usuario());
					pstm.setInt(2, carrito.getId_producto());
					pstm.setString(3, carrito.getNombre());
					pstm.setInt(4, carrito.getCantidad());
					pstm.setFloat(5, carrito.getPrecio());
					pstm.setBytes(6, carrito.getImagen());
					System.out.println(pstm);
					int rows = pstm.executeUpdate();

					if (rows > 0) {
						mensaje = "Producto añadido con éxito al carrito.";
						sesion.setAttribute("mensaje", mensaje);
						request.getRequestDispatcher("/tienda.jsp").forward(request, response);
					} else {
						mensaje = "Error al añadir el producto al carrito, contacte con el administrador.";
						sesion.setAttribute("mensaje", mensaje);
						request.getRequestDispatcher("/contacto.jsp").forward(request, response);
					}
				}

			} catch (SQLException e) {
				e.printStackTrace();

			}
		} else if (request.getParameter("wishlist") != null) {
			wishlist.setId_usuario(id);
			wishlist.setId_producto(Integer.parseInt(request.getParameter("pid")));
			wishlist.setNombre(request.getParameter("p_nombre"));
			wishlist.setPrecio(Float.parseFloat(request.getParameter("p_precio")));
			wishlist.setImagen((request.getParameter("p_imagen").getBytes()));

			sql = "SELECT * FROM \"comprix\".wishlist WHERE id_usuario=? AND nombre=?";
			try {
				pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pstm.setInt(1, wishlist.getId_usuario());
				pstm.setString(2, wishlist.getNombre());
				System.out.println(pstm);
				rs = pstm.executeQuery();

				rs.last();
				numberOfRows = rs.getRow();
				rs.beforeFirst();

				if (numberOfRows > 0) {
					mensaje = "El producto ya está añadido a la wishlist.";
					sesion.setAttribute("mensaje", mensaje);
					request.getRequestDispatcher("/tienda.jsp").forward(request, response);
				} else {
					sql = "SELECT * FROM \"comprix\".carrito WHERE id_usuario=? AND nombre=?";
					pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					pstm.setInt(1, wishlist.getId_usuario());
					pstm.setString(2, wishlist.getNombre());
					System.out.println(pstm);
					rs = pstm.executeQuery();

					rs.last();
					numberOfRows = rs.getRow();
					rs.beforeFirst();

					if (numberOfRows > 0) {
						mensaje = "El producto ya está añadido al carrito.";
						sesion.setAttribute("mensaje", mensaje);
						request.getRequestDispatcher("/tienda.jsp").forward(request, response);
					}

					sql = "INSERT INTO \"comprix\".wishlist (id_usuario,id_producto,nombre,precio,imagen) VALUES(?,?,?,?,?)";
					pstm = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					pstm.setInt(1, wishlist.getId_usuario());
					pstm.setInt(2, wishlist.getId_producto());
					pstm.setString(3, wishlist.getNombre());
					pstm.setFloat(4, wishlist.getPrecio());
					pstm.setBytes(5, wishlist.getImagen());
					System.out.println(pstm);
					int rows = pstm.executeUpdate();

					if (rows > 0) {
						mensaje = "Producto añadido con éxito a la Wishlist.";
						sesion.setAttribute("mensaje", mensaje);
						request.getRequestDispatcher("/tienda.jsp").forward(request, response);
					} else {
						mensaje = "Error al añadir el producto a la Wishlist, contacte con el administrador.";
						sesion.setAttribute("mensaje", mensaje);
						request.getRequestDispatcher("/contacto.jsp").forward(request, response);
					}
				}

			} catch (SQLException e) {
				e.printStackTrace();

			}

			try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
