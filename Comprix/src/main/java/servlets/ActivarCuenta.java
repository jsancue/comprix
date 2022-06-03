package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UsuarioDAO;

/**
 * Servlet implementation class ActivarCuenta
 */
@WebServlet("/ActivarCuenta")
public class ActivarCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sesion = request.getSession();

		String email = request.getParameter("key1");
		String hash = request.getParameter("key2");
		String mensaje = "";

		UsuarioDAO usuario = new UsuarioDAO();

		if (usuario.ActivarCuenta(email, hash)) {
			mensaje = "Cuenta verificado con éxito.";

			sesion.setAttribute("mensaje", mensaje);
			response.sendRedirect("login.jsp");
			System.out.println("Cuenta Veridicada con Éxito.");
		} else {
			response.sendRedirect("register.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
