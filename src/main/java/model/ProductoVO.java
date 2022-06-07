package model;

import java.util.Arrays;

public class ProductoVO {
	private int id;
	private String nombre;
	private String categoria;
	private String detalles;
	private float precio;
	private byte[] imagen;

	public ProductoVO() {
		super();
	}

	public ProductoVO(int id, String nombre, String categoria, String detalles, float precio, byte[] imagen) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.categoria = categoria;
		this.detalles = detalles;
		this.precio = precio;
		this.imagen = imagen;
	}

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

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getDetalles() {
		return detalles;
	}

	public void setDetalles(String detalles) {
		this.detalles = detalles;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
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
		return "ProductoVO [id=" + id + ", nombre=" + nombre + ", categoria=" + categoria + ", detalles=" + detalles
				+ ", precio=" + precio + ", imagen=" + Arrays.toString(imagen) + "]";
	}

}
