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

import model.DireccionVO;
import utils.ConexionDB;

/**
 * Servlet implementation class AñadirDireccion
 */
@WebServlet("/AñadirDireccion")
public class AñadirDireccion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		DireccionVO direccion = new DireccionVO();
		String mensaje = "";
		int id_usuario = (Integer) sesion.getAttribute("id");

		direccion.setId_usuario(id_usuario);
		direccion.setAlias(request.getParameter("alias"));
		direccion.setCalle1(request.getParameter("calle"));
		direccion.setCalle2(request.getParameter("calle2"));
		direccion.setNumero(request.getParameter("num"));
		direccion.setLetra(request.getParameter("letra"));
		direccion.setPais(request.getParameter("pais"));
		direccion.setProvincia(request.getParameter("provincia"));
		direccion.setCiudad(request.getParameter("ciudad"));
		direccion.setCpostal(request.getParameter("c_postal"));
		direccion.setDetalles(request.getParameter("detalles"));

		Connection con;
		PreparedStatement pstm;

		con = ConexionDB.conectar();

		String query = "INSERT INTO  \"comprix\".direccion (id_usuario,alias,calle1,calle2,numero,letra,pais,provincia,ciudad,cpostal,detalles) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstm = con.prepareStatement(query);
			pstm.setInt(1, direccion.getId_usuario());
			pstm.setString(2, direccion.getAlias());
			pstm.setString(3, direccion.getCalle1());
			pstm.setString(4, direccion.getCalle2());
			pstm.setString(5, direccion.getNumero());
			pstm.setString(6, direccion.getLetra());
			pstm.setString(7, direccion.getPais());
			pstm.setString(8, direccion.getProvincia());
			pstm.setString(9, direccion.getCiudad());
			pstm.setString(10, direccion.getCpostal());
			pstm.setString(11, direccion.getDetalles());

			int i = pstm.executeUpdate();

			try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (i != 0) {
				mensaje = "Dirección añadida.";
				System.out.println(mensaje);
				sesion.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("/usuarios_perfil_actualizar.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
