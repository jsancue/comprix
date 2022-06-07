package model;

import java.util.Arrays;

public class UsuarioVO {
	private int id;
	private String nombre;
	private String apellidos;
	private String email;
	private String password;
	private String token;
	private int tipo;
	private int activado;
	private byte[] imagen;
	private String base64Image;

	// Constructors
	public UsuarioVO() {
		super();
	}

	public UsuarioVO(int id, String nombre, String apellidos, String email, String password, String token, int tipo,
			int activado, byte[] imagen, String base64Image) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.password = password;
		this.token = token;
		this.tipo = tipo;
		this.activado = activado;
		this.imagen = imagen;
		this.setBase64Image(base64Image);
	}

	// Getters & Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public int getActivado() {
		return activado;
	}

	public void setActivado(int activado) {
		this.activado = activado;
	}

	public byte[] getImagen() {
		return imagen;
	}

	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}

	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	// ToString
	@Override
	public String toString() {
		return "UsuarioVO [id=" + id + ", nombre=" + nombre + ", apellidos=" + apellidos + ", email=" + email
				+ ", password=" + password + ", token=" + token + ", tipo=" + tipo + ", activado=" + activado
				+ ", imagen=" + Arrays.toString(imagen) + "]";
	}
}
