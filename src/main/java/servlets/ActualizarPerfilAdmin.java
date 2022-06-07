package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import utils.ConexionDB;
import utils.RandomString;
import utils.SHA256;

/**
 * Servlet implementation class ActualizarPerfil
 */
@WebServlet("/ActualizarPerfilAdmin")
public class ActualizarPerfilAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String nombre, apellidos, email, new_pass, c_pass;
	FileItem flItem = null;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession();
		response.setContentType("UTF-8");
		request.setCharacterEncoding("UTF-8");
		SHA256 hashPass = new SHA256();
		File file = null;
		FileInputStream fis;
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement pstm = null;
		String mensaje = "";
		String filePath = this.getServletContext().getRealPath("/WEB-INF/data/");
		String fileName = null;
		int id = (Integer) sesion.getAttribute("id");
		try {
			int maxFileSize = 5000 * 1024;
			int maxMemSize = 5000 * 1024;
			boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
			if (isMultiPart) {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setSizeMax(maxFileSize);
				List items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				while (iter.hasNext()) {
					FileItem fileItem = iter.next();
					if (fileItem.isFormField()) {
						processFormField(fileItem);
					} else {
						flItem = fileItem;
						fileName = fileItem.getName();
						if (fileName.lastIndexOf("/") >= 0) {
							file = new File(filePath + fileName.substring(fileName.lastIndexOf("/")));
						} else {
							file = new File(filePath + "/" + fileName.substring(fileName.lastIndexOf("/") + 1));
						}
						fileItem.write(file);
					}

				}

				String enc_password = hashPass.get_SHA_256_SecurePassword(new_pass, "secreto");
				String hash = RandomString.getRandomString(20);
				String rutaImagen = filePath + "/" + fileName;
				fis = new FileInputStream(file);
				con = ConexionDB.conectar();

				if (new_pass.equals(c_pass)) {
					String query = "UPDATE \"comprix\".usuario SET nombre=?,apellidos=?,email=?,password=?,imagen=? WHERE id=? AND tipo=1";
					pstm = con.prepareStatement(query);
					pstm.setString(1, nombre);
					pstm.setString(2, apellidos);
					pstm.setString(3, email);
					pstm.setString(4, enc_password);
					pstm.setBinaryStream(5, fis, file.length());
					pstm.setInt(6, id);

					int rows = pstm.executeUpdate();
					if (rows > 0) {
						mensaje = "Perfil actualizado exitosamente.";
						sesion.setAttribute("mensaje", mensaje);
						response.sendRedirect("/admin_perfil_actualizar.jsp");
					} else {
						mensaje = "Error al crear la cuenta, porfavor contacte con el soporte de Comprix.";
						sesion.setAttribute("mensaje", mensaje);
						request.getRequestDispatcher("/admin_index.jsp").forward(request, response);
					}
					try {
						con.close();
						pstm.close();
					} catch (Exception ex) {
						out.println(ex.getMessage());
					}
				} else {
					mensaje = "Las contraseñas no coinciden, porfavor intentelo de nuevo...";
					sesion.setAttribute("mensaje", mensaje);
					request.getRequestDispatcher("/admin_perfil_actualizar.jsp").forward(request, response);
				}
			}
		} catch (Exception ex) {
			out.println(ex.getMessage());
		}
		out.close();
	}

	private void processFormField(FileItem item) {
		// String na = item.getFieldName();
		if (item.getFieldName().equals("nombre")) {
			nombre = item.getString();
		} else if (item.getFieldName().equals("apellidos")) {
			apellidos = item.getString();
		} else if (item.getFieldName().equals("email")) {
			email = item.getString();
		} else if (item.getFieldName().equals("new_pass")) {
			new_pass = item.getString();
		} else if (item.getFieldName().equals("c_pass")) {
			c_pass = item.getString();
		}
	}

}
