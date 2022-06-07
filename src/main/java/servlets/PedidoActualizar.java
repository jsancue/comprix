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

import model.PedidoVO;
import utils.ConexionDB;

/**
 * Servlet implementation class PedidoActualizar
 */
@WebServlet("/PedidoActualizar")
public class PedidoActualizar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		PedidoVO pedido = new PedidoVO();
		String mensaje = "";

		pedido.setId(Integer.parseInt(request.getParameter("id_pedido")));
		pedido.setEstado(Integer.parseInt(request.getParameter("actualizar_pago")));

		Connection con;
		PreparedStatement pstm;

		con = ConexionDB.conectar();

		String query = "UPDATE  \"comprix\".pedido SET estado = ? WHERE id = ?";
		try {
			pstm = con.prepareStatement(query);
			pstm.setInt(1, pedido.getEstado());
			pstm.setInt(2, pedido.getId());

			int i = pstm.executeUpdate();

			try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (i != 0) {
				mensaje = "Pedido actualizado con éxito.";
				System.out.println(mensaje);
				sesion.setAttribute("mensaje", mensaje);
				sesion.setAttribute("eliminar", 0);
				request.getRequestDispatcher("/admin_pedidos.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}

	}
}
