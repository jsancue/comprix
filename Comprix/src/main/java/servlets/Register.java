package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
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

import model.UsuarioDAO;
import model.UsuarioVO;
import utils.ConexionDB;
import utils.EnviarEmail;
import utils.HashPass;
import utils.RandomString;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sesion = request.getSession();
		UsuarioDAO gestionUsuario = new UsuarioDAO();
		UsuarioVO usuario = new UsuarioVO();
		HashPass hashPass = new HashPass();
		String password = null;
		String cpassword = null;
		File file = new File(
				"/home/jesus/Documentos/TFG/eclipse-workspace/Comprix/src/main/webapp/images/user_default.jpg");
		FileInputStream fis = new FileInputStream(file);

		usuario.setNombre(request.getParameter("nombre"));
		usuario.setApellidos(request.getParameter("apellidos"));
		usuario.setEmail(request.getParameter("email"));
		password = (request.getParameter("password"));
		cpassword = (request.getParameter("cpassword"));

		byte[] salt = null;
		try {
			salt = hashPass.getSalt();
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String enc_password = HashPass.getSecurePassword(password, salt);
		usuario.setPassword(enc_password);
		System.out.println("Contraseña: " + enc_password);
		System.out.println("Confirmar Contraseña: " + enc_password);

		String hash = RandomString.getRandomString(20);
		usuario.setToken(hash);
		System.out.println("Hash: " + hash);

		Connection con;
		PreparedStatement pstm;

		con = ConexionDB.conectar();

		String query = "INSERT INTO \"comprix\".usuario (nombre,apellidos,email,password,token,imagen) VALUES(?,?,?,?,?,?)";

		try {
			pstm = con.prepareStatement(query);
			pstm.setString(1, usuario.getNombre());
			pstm.setString(2, usuario.getApellidos());
			pstm.setString(3, usuario.getEmail());
			pstm.setString(4, usuario.getPassword());
			pstm.setString(5, usuario.getToken());
			pstm.setBinaryStream(6, fis, (int) file.length());

			int i = pstm.executeUpdate();

			try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (i != 0) {
				System.out.println("Usuario creado.");
				System.out.println("Enviando email... ");

				EnviarEmail enviador = new EnviarEmail(usuario.getEmail(), usuario.getToken());
				enviador.enviarEMail();

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (password.equals(cpassword)) {
			System.out.println("entro");
			if (!gestionUsuario.estaRegistrado(usuario.getEmail())) {
				if (gestionUsuario.Register(usuario)) {
					sesion.setAttribute("email", usuario.getEmail());
					request.getRequestDispatcher("/index.jsp").forward(request, response);
				} else {
					System.out.println("Error");
					request.getRequestDispatcher("/register.jsp").forward(request, response);
				}
			} else {
				request.getRequestDispatcher("/register.jsp").forward(request, response);
			}
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		} else {
			System.out.println("no entro");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}

	}
}
