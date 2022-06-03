package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.ConexionDB;

/**
 * Servlet implementation class CargarImagenUsuario
 */
@WebServlet("/CargarImagenUsuario")
public class CargarImagenUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	HttpSession sesion = null;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		byte[] buf = null;

		sesion = request.getSession();

		int id = (Integer) sesion.getAttribute("id");

		con = ConexionDB.conectar();

		String sql = "select imagen from \"comprix\".usuario where id=?";

		try {

			pstm = con.prepareStatement(sql);
			pstm.setInt(1, id);
			rs = pstm.executeQuery();
			System.out.println(pstm);

			// Image data is read into the buffer
			if (rs.next()) {
				System.out.println("entro");
				buf = rs.getBytes(1);
			} else {
				buf = new byte[0];
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		System.out.println(buf);
		// Response.setContentType (content_type);
		// Tells the browser to output pictures
		response.setContentType("image/jpg");
		// Output image output stream
		ServletOutputStream out = response.getOutputStream();
		// Output to the input of the buffer page
		out.write(buf);
		// Input is completed, clear buffer
		out.flush();
	}

}
