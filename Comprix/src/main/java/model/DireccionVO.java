package model;

public class DireccionVO {
	private int id;
	private int id_usuario;
	private String alias;
	private String calle1;
	private String calle2;
	private String numero;
	private String letra;
	private String pais;
	private String ciudad;
	private String cpostal;
	private String detalles;

	public DireccionVO() {
		super();
	}

	public DireccionVO(int id, int id_usuario, String alias, String calle1, String calle2, String numero, String letra,
			String pais, String ciudad, String cpostal, String detalles) {
		super();
		this.id = id;
		this.id_usuario = id_usuario;
		this.alias = alias;
		this.calle1 = calle1;
		this.calle2 = calle2;
		this.numero = numero;
		this.letra = letra;
		this.pais = pais;
		this.ciudad = ciudad;
		this.cpostal = cpostal;
		this.detalles = detalles;
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

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getCalle1() {
		return calle1;
	}

	public void setCalle1(String calle1) {
		this.calle1 = calle1;
	}

	public String getCalle2() {
		return calle2;
	}

	public void setCalle2(String calle2) {
		this.calle2 = calle2;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getLetra() {
		return letra;
	}

	public void setLetra(String letra) {
		this.letra = letra;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getCpostal() {
		return cpostal;
	}

	public void setCpostal(String cpostal) {
		this.cpostal = cpostal;
	}

	public String getDetalles() {
		return detalles;
	}

	public void setDetalles(String detalles) {
		this.detalles = detalles;
	}

	@Override
	public String toString() {
		return "DireccionVO [id=" + id + ", id_usuario=" + id_usuario + ", alias=" + alias + ", calle1=" + calle1
				+ ", calle2=" + calle2 + ", numero=" + numero + ", letra=" + letra + ", pais=" + pais + ", ciudad="
				+ ciudad + ", cpostal=" + cpostal + ", detalles=" + detalles + "]";
	}

}
