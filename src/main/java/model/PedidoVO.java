package model;

import java.util.Date;

public class PedidoVO {
	private int id;
	private int id_usuario;
	private String nombre;
	private String apellidos;
	private String telefono;
	private String email;
	private int metodo;
	private int direccion;
	private String productos_total;
	private String precio_total;
	private Date fecha;
	private int estado;

	public PedidoVO() {
		super();
	}

	public PedidoVO(int id, int id_usuario, String nombre, String apellidos, String telefono, String email, int metodo,
			int direccion, String productos_total, String precio_total, Date fecha, int estado) {
		super();
		this.id = id;
		this.id_usuario = id_usuario;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.telefono = telefono;
		this.email = email;
		this.metodo = metodo;
		this.direccion = direccion;
		this.productos_total = productos_total;
		this.precio_total = precio_total;
		this.fecha = fecha;
		this.estado = estado;
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

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMetodo() {
		return metodo;
	}

	public void setMetodo(int metodo) {
		this.metodo = metodo;
	}

	public int getDireccion() {
		return direccion;
	}

	public void setDireccion(int direccion) {
		this.direccion = direccion;
	}

	public String getProductos_total() {
		return productos_total;
	}

	public void setProductos_total(String productos_total) {
		this.productos_total = productos_total;
	}

	public String getPrecio_total() {
		return precio_total;
	}

	public void setPrecio_total(String precio_total) {
		this.precio_total = precio_total;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "PedidoVO [id=" + id + ", id_usuario=" + id_usuario + ", nombre=" + nombre + ", apellidos=" + apellidos
				+ ", telefono=" + telefono + ", email=" + email + ", metodo=" + metodo + ", direccion=" + direccion
				+ ", productos_total=" + productos_total + ", precio_total=" + precio_total + ", fecha=" + fecha
				+ ", estado=" + estado + "]";
	}

}
