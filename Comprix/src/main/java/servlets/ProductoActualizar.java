package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ProductoVO;
import utils.ConexionDB;

/**
 * Servlet implementation class ProductoActualizar
 */
@WebServlet("/ProductoActualizar")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
public class ProductoActualizar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		ProductoVO producto = new ProductoVO();
		String mensaje = "";

		int pid = Integer.parseInt(request.getParameter("pid"));
		producto.setNombre(request.getParameter("nombre"));
		producto.setCategoria(request.getParameter("categoria"));
		producto.setDetalles(request.getParameter("detalles"));
		producto.setPrecio(request.getParameter("precio"));
		// producto.setImagen(request.getPart("imagen"));

		Connection con;
		PreparedStatement pstm;

		con = ConexionDB.conectar();

		String query = "UPDATE  \"comprix\".producto SET nombre = ?, categoria = ?, detalles = ?, precio = ? WHERE id = ?";
		try {
			pstm = con.prepareStatement(query);
			pstm.setString(1, producto.getNombre());
			pstm.setString(2, producto.getCategoria());
			pstm.setString(3, producto.getDetalles());
			pstm.setString(4, producto.getPrecio());
			pstm.setInt(5, pid);

			int i = pstm.executeUpdate();

			try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (i != 0) {
				mensaje = "Producto Actualizado.";
				System.out.println(mensaje);
				sesion.setAttribute("mensaje", mensaje);
				sesion.setAttribute("eliminar", 0);
				request.getRequestDispatcher("/admin_productos.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
