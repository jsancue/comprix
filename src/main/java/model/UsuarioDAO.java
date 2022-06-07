package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.ConexionDB;
import utils.EnviarEmail;

public class UsuarioDAO {

	public boolean LogIn(String email, String password) {
		ResultSet rs;
		Connection con;
		PreparedStatement pstm;

		boolean isInDB = false;

		con = ConexionDB.conectar();

		String query = "SELECT *  FROM \"comprix\".usuario WHERE email = ? AND password = ? AND activado='1'";

		try {
			pstm = con.prepareStatement(query);
			pstm.setString(1, email);
			pstm.setString(2, password);

			pstm.execute();
			rs = pstm.executeQuery();

			isInDB = rs.next();

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

		return isInDB;
	}

	public boolean estaRegistrado(String email) {
		ResultSet rs;
		Connection con;
		PreparedStatement pstm;
		boolean estaRegistrado = false;

		con = ConexionDB.conectar();

		String query = "SELECT *  FROM \"comprix\".usuario WHERE email = ?";

		try {
			pstm = con.prepareStatement(query);
			pstm.setString(1, email);

			pstm.execute();
			rs = pstm.executeQuery();

			estaRegistrado = rs.next();

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

		return estaRegistrado;
	}

	public boolean Register(UsuarioVO usuario) {

		Connection con;
		PreparedStatement pstm;
		boolean usuarioCreado = false;

		con = ConexionDB.conectar();

		String query = "INSERT INTO \"comprix\".usuario (nombre,apellidos,email,password,token,imagen) VALUES(?,?,?,?,?,?)";

		try {
			pstm = con.prepareStatement(query);
			pstm.setString(1, usuario.getNombre());
			pstm.setString(2, usuario.getApellidos());
			pstm.setString(3, usuario.getEmail());
			pstm.setString(4, usuario.getPassword());
			pstm.setString(5, usuario.getToken());
			pstm.setBytes(6, usuario.getImagen());

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

				usuarioCreado = true;

			}

			return usuarioCreado;

		} catch (SQLException e) {
			e.printStackTrace();
			return usuarioCreado;
		}

	}

	public boolean ActivarCuenta(String email, String token) {

		Connection con;
		PreparedStatement pst;
		boolean usuarioActivado = false;

		con = ConexionDB.conectar();

		String query = "SELECT *  FROM \"comprix\".usuario WHERE email =? AND token=? AND activado='0'";

		try {

			pst = con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, token);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				PreparedStatement pst1 = con
						.prepareStatement("UPDATE \"comprix\".usuario SET activado='1' WHERE email=? AND token=?");
				pst1.setString(1, email);
				pst1.setString(2, token);

				int i = pst1.executeUpdate();

				if (i == 1) {
					usuarioActivado = true;
					System.out.println("Cuenta Verificada Correctamente.");
				} else {
					usuarioActivado = false;
				}
			}
			try {
				con.close();
				pst.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			System.out.println("Error en ActivarCuenta.java: " + e);
		}

		return usuarioActivado;

	}

	public boolean esAdmin(String email) {

		Connection con;
		PreparedStatement pstm;
		boolean esAdmin = false;

		con = ConexionDB.conectar();

		String query = "SELECT * FROM \"comprix\".usuario WHERE email=? AND tipo='1'";

		try {
			pstm = con.prepareStatement(query);
			pstm.setString(1, email);
			ResultSet rs = pstm.executeQuery();

			if (rs.next()) {
				esAdmin = true;
			} else {
				esAdmin = false;
			}

		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error en UsuarioDAO.java: " + e);
		}

		return esAdmin;
	}

}
