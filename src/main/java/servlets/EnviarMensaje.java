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

import model.MensajeVO;
import utils.ConexionDB;

/**
 * Servlet implementation class EnviarMensaje
 */
@WebServlet("/EnviarMensaje")
public class EnviarMensaje extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		int id = (Integer) sesion.getAttribute("id");
		MensajeVO mensajeEnviado = new MensajeVO();
		String mensaje = "";

		mensajeEnviado.setNombre(request.getParameter("nombre"));
		mensajeEnviado.setApellidos(request.getParameter("apellidos"));
		mensajeEnviado.setEmail(request.getParameter("email"));
		mensajeEnviado.setTelefono(request.getParameter("telefono"));
		mensajeEnviado.setMensaje(request.getParameter("mensaje"));

		Connection con;
		PreparedStatement pstm;

		con = ConexionDB.conectar();

		String query = "INSERT INTO \"comprix\".mensaje (id_usuario,nombre,apellidos,email,telefono,mensaje) VALUES (?,?,?,?,?,?)";
		try {
			pstm = con.prepareStatement(query);
			pstm.setInt(1, id);
			pstm.setString(2, mensajeEnviado.getNombre());
			pstm.setString(3, mensajeEnviado.getApellidos());
			pstm.setString(4, mensajeEnviado.getEmail());
			pstm.setString(5, mensajeEnviado.getTelefono());
			pstm.setString(6, mensajeEnviado.getMensaje());

			int i = pstm.executeUpdate();

			try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (i != 0) {
				mensaje = "Mensaje enviado con éxito.";
				sesion.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("/contacto.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}
	}

}
