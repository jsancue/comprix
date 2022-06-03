package model;

import java.util.Arrays;

public class WishlistVO {
	private int id;
	private int id_usuario;
	private int id_producto;
	private String nombre;
	private String apellidos;
	private String precio;
	private byte[] imagen;

	public WishlistVO() {
		super();
	}

	public WishlistVO(int id, int id_usuario, int id_producto, String nombre, String apellidos, String precio,
			byte[] imagen) {
		super();
		this.id = id;
		this.id_usuario = id_usuario;
		this.id_producto = id_producto;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.precio = precio;
		this.imagen = imagen;
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

	public int getId_producto() {
		return id_producto;
	}

	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
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

	public String getPrecio() {
		return precio;
	}

	public void setPrecio(String precio) {
		this.precio = precio;
	}

	public byte[] getImagen() {
		return imagen;
	}

	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}

	@Override
	public String toString() {
		return "WishlistVO [id=" + id + ", id_usuario=" + id_usuario + ", id_producto=" + id_producto + ", nombre="
				+ nombre + ", apellidos=" + apellidos + ", precio=" + precio + ", imagen=" + Arrays.toString(imagen)
				+ "]";
	}

}
