package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
	public static Connection conectar() {
		Connection con = null;
		String usuario = "a21_jsancue";
		String pass = "a21_jsancue";
		String url = "jdbc:postgresql://ns3034756.ip-91-121-81.eu:5432/a21_jsancue";

		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("La clase no se encontró: " + e);
		}

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(url, usuario, pass);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return con;
	}
}
