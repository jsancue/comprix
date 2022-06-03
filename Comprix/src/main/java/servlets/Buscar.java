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

import utils.ConexionDB;

/**
 * Servlet implementation class Buscar
 */
@WebServlet("/Buscar")
public class Buscar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		int id = (Integer) sesion.getAttribute("id");
		String s = "";
		String mensaje = "";

		s = (request.getParameter("busqueda"));
		System.out.println(s);
		Connection con;
		PreparedStatement pstm;
		ResultSet rs = null;

		con = ConexionDB.conectar();

		String query = "SELECT * FROM \"comprix\".producto WHERE (nombre LIKE '%" + s + "%') OR (categoria LIKE '%" + s
				+ "%')";
		try {
			pstm = con.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			System.out.println(pstm);
			rs = pstm.executeQuery();

			rs.last();
			int numberOfRows = rs.getRow();
			rs.beforeFirst();

			try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (numberOfRows > 0) {
				sesion.setAttribute("s", s);
				request.getRequestDispatcher("/buscar.jsp").forward(request, response);
			} else {
				sesion.setAttribute("s", null);
				request.getRequestDispatcher("/buscar.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}
	}

}
