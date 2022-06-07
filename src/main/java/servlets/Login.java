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

import model.UsuarioDAO;
import utils.ConexionDB;
import utils.SHA256;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sesion = request.getSession();
		UsuarioDAO usuario = new UsuarioDAO();
		SHA256 hashPass = new SHA256();
		String mensaje = "";

		String email;
		String password;
		boolean logueado = false;
		int tipo = 0;

		email = request.getParameter("email");
		password = request.getParameter("password");

		password = hashPass.get_SHA_256_SecurePassword(password, "secreto");

		try {
			ResultSet rs;
			Connection con;
			PreparedStatement pstm;

			con = ConexionDB.conectar();

			String query = "SELECT * FROM \"comprix\".usuario WHERE email=? AND password=? AND activado=1";

			try {
				pstm = con.prepareStatement(query);
				pstm.setString(1, email);
				pstm.setString(2, password);

				rs = pstm.executeQuery();

				if (rs != null) {
					while (rs.next()) {
						int id = rs.getInt("id");
						String nombre = rs.getString("nombre");
						String apellidos = rs.getString("apellidos");
						tipo = rs.getInt("tipo");
						logueado = true;
						System.out.println(tipo);
						sesion.setAttribute("logueado", logueado);
						sesion.setAttribute("id", id);
						sesion.setAttribute("tipo", tipo);

						if (tipo == 0) {
							request.getRequestDispatcher("/index.jsp").forward(request, response);
						} else {
							request.getRequestDispatcher("/admin_index.jsp").forward(request, response);
						}
					}

				} else {
					mensaje = "Error al iniciar sesion. Porfavor introduzca los datos correctamente. (En el caso de que estés introduciendo bien los datos, porfavor contacte con el soporte de Comprix, gracias).";
					sesion.setAttribute("mensaje", mensaje);
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}

				try {
					con.close();
					pstm.close();
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (

		Exception e) {
			System.out.println("Error en Login.java: " + e);
		}
	}

}
