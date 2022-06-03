package model;

public class MensajeVO {
	private int id;
	private int id_usuario;
	private String nombre;
	private String apellidos;
	private String email;
	private String telefono;
	private String mensaje;

	public MensajeVO() {
		super();
	}

	public MensajeVO(int id, int id_usuario, String nombre, String apellidos, String email, String telefono,
			String mensaje) {
		super();
		this.id = id;
		this.id_usuario = id_usuario;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.email = email;
		this.telefono = telefono;
		this.mensaje = mensaje;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId_usuario() {
		return id_usuario;
	}

	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
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

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	@Override
	public String toString() {
		return "MensajeVO [id=" + id + ", id_usuario=" + id_usuario + ", nombre=" + nombre + ", apellidos=" + apellidos
				+ ", email=" + email + ", telefono=" + telefono + ", mensaje=" + mensaje + "]";
	}

}
