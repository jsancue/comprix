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

/**
 * Servlet implementation class ProductoActualizar
 */
@WebServlet("/ProductoActualizar")
public class ProductoActualizar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int pid = 0;
	float precio = 0;
	String nombre, categoria, detalles;
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
		File file = null;
		FileInputStream fis;
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement pstm = null;
		String mensaje = "";
		String filePath = this.getServletContext().getRealPath("/WEB-INF/data/");
		String fileName = null;

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

				String rutaImagen = filePath + "/" + fileName;
				fis = new FileInputStream(file);
				con = ConexionDB.conectar();

				String query = "UPDATE \"comprix\".producto SET nombre=?,categoria=?,detalles=?,imagen=?,precio=? WHERE id=?";
				pstm = con.prepareStatement(query);
				pstm.setString(1, nombre);
				pstm.setString(2, categoria);
				pstm.setString(3, detalles);
				pstm.setBinaryStream(4, fis, file.length());
				pstm.setFloat(5, precio);
				pstm.setInt(6, pid);

				int rows = pstm.executeUpdate();
				if (rows > 0) {
					mensaje = "Producto actualizado correctamente.";
					sesion.setAttribute("mensaje", mensaje);
					sesion.setAttribute("eliminar", 0);
					response.sendRedirect("/admin_productos.jsp");
				} else {
					mensaje = "Error al actualizar el producto.";
					sesion.setAttribute("eliminar", 0);
					sesion.setAttribute("mensaje", mensaje);
					request.getRequestDispatcher("/admin_productos.jsp").forward(request, response);
				}
				try {
					con.close();
					pstm.close();
				} catch (Exception ex) {
					out.println(ex.getMessage());
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
		} else if (item.getFieldName().equals("categoria")) {
			categoria = item.getString();
		} else if (item.getFieldName().equals("detalles")) {
			detalles = item.getString();
		} else if (item.getFieldName().equals("precio")) {
			precio = Float.parseFloat(item.getString());
		} else if (item.getFieldName().equals("pid")) {
			pid = Integer.parseInt(item.getString());
		}
	}

}
