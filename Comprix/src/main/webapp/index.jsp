<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Comprix | Inicio</title>
	<meta content="Comprix, un almacen de productos frescos, saludables y orgánicos al mejor precio." name="description">
	<!-- Formato favicon recomendado -->
	<link href="assets/iconos/apple-touch-icon.png" rel="apple-touch-icon" sizes="180x180">
	<link href="assets/iconos/favicon-32x32.png" rel="icon" sizes="32x32" type="image/png">
	<link href="assets/iconos/android-chrome-192x192.png" rel="icon" sizes="192x192" type="image/png">
	<link href="assets/iconos/favicon-16x16.png" rel="icon" sizes="16x16" type="image/png">
	<link href="assets/iconos/site.webmanifest" rel="manifest">
	<link href="assets/iconos/safari-pinned-tab.svg" rel="mask-icon">
	<meta content="Comprix" name="apple-mobile-web-app-title">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="Comprix" name="application-name">
	<meta content="#27ae60" name="msapplication-TileColor">
	<meta content="assets/iconos/browserconfig.xml" name="msapplication-config">
	<meta content="#27ae60" name="theme-color">
	<!--facebook meta-->
	<meta content="website" property="og:type">
	<meta content="https://comprix.netlify.app/index.html" property="og:url">
	<meta content="Comprix | Inicio" property="og:title">
	<meta content="assets/icon/android-chrome-192x192.png" property="og:image">
	<meta content="Comprix, un almacen de productos frescos, saludables y orgánicos al mejor precio." property="og:description">
	<meta content="Comprix" property="og:site_name">
	<meta content="es_ES" property="og:locale">
	<!-- Las siguientes etiquetas son opcionales, pero recomendadas -->
	<meta content="1200" property="og:image:width">
	<meta content="630" property="og:image:height">
	<!--twitter meta-->
	<meta content="summary" name="twitter:card">
	<meta content="@comprix" name="twitter:site">
	<meta content="@comprix" name="twitter:creator">
	<meta content="https://comprix.netlify.app/index.html" name="twitter:url">
	<meta content="Comprix | Inicio" name="twitter:title">
	<meta content="Comprix, un almacen de productos frescos, saludables y orgánicos al mejor precio." name="twitter:description">
	<meta content="assets/icon/android-chrome-192x192.png" name="twitter:image">
	<!-- Indicamos el idioma definido para la página actual -->
	<link href="index.html" hreflang="es" rel="alternate">
	<!-- font awesome cdn link  -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
	<!-- custom css file link  -->
	<link href="css/styles.css" rel="stylesheet">
</head>
<body>
<%
Connection con = null;
String usuario = "a21_jsancue";
String pass = "a21_jsancue";
String url = "jdbc:postgresql://ns3034756.ip-91-121-81.eu:5432/a21_jsancue";

try {
	Class.forName("org.postgresql.Driver");
	con = DriverManager.getConnection(url, usuario, pass);
} catch (SQLException e) {
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

PreparedStatement pstm=null;
String query = "";
ResultSet rs;
%>
	<jsp:include page="header.jsp" />
	<div class="carousel-bg">
		<section class="carousel">
			<div class="contenido">
				<span>no te agobies, organizate</span>
				<h3>Consigue tu YO mas saludable con Comprix</h3>
				<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto natus culpa officia quasi, accusantium explicabo?</p><a class="btn" href="nosotros.html">Sobre Nosotros</a>
			</div>
		</section>
	</div>
	<section class="inicio-categoria">
		<h1 class="titulo">Productos por Categoria</h1>
		<div class="caja-contenedora">
			<div class="caja">
				<img alt="Foto de la Categoria Frutas" src="./assets/img/frutas.png">
				<h3>Frutas</h3>
				<p>Más salud y sabor, conoce las frutas de temporada en España y su origen.</p>
				<a class="btn" href="categoria.jsp?categoria=fruta">Frutas</a>
			</div>
			<div class="caja">
				<img alt="Foto de la Categoria Carne" src="./assets/img/carne.png">
				<h3>Carne</h3>
				<p>Productos cárnicos de elaboración propia con la mejor garantía de calidad.</p>
				<a class="btn" href="categoria.jsp?categoria=carne">Carne</a>
			</div>
			<div class="caja">
				<img alt="Foto de la Categoria Verduras" src="./assets/img/verduras.png">
				<h3>Verduras</h3>
				<p>Los mejores productos frescos, y saludables con calidad certificada.</p>
				<a class="btn" href="categoria.jsp?categoria=verdura">Verduras</a>
			</div>
			<div class="caja">
				<img alt="Foto de la Categoria Pescado" src="./assets/img/pescado.png">
				<h3>Pescado</h3>
				<p>Productos capturados mediante pesca artesanal selectiva, que respeta el medioambiente.</p>
				<a class="btn" href="categoria.jsp?categoria=pescado">Pescado</a>
			</div>
		</div>
	</section>
	<section class="productos">
		<h1 class="titulo">Últimos Productos</h1>
		<div class="caja-contenedora">
			<%
			//OutputStream o = response.getOutputStream();
		    query = "SELECT * FROM \"comprix\".producto LIMIT 6";
			try {
				pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			  	rs = pstm.executeQuery();
			  	rs.last();
			  	int numberOfRows = rs.getRow(); 
			  	rs.beforeFirst();    
			  	
				if(numberOfRows>0){
				  	while(rs.next()){
				  		int id=rs.getInt(1);
				  		String nombre=rs.getString(2);
				  		String categoria=rs.getString(3);
				  		String detalles=rs.getString(4);
				  		String precio=rs.getString(5);
				  		byte[] imagen = rs.getBytes(6);
		  	%>
			<form action="" class="caja" method="post">
				<div class="precio"><span><%=precio%></span>€/Kg</div>
				<a class="fa-solid fa-eye" href="vista_rapida.jsp?pid=<%=id%>"></a> 
				<img alt="foto producto" src="">
				<div class="nombre"><%=nombre%></div>
				<input name="pid" type="hidden" value="<%=id%>"> 
				<input name="p_nombre" type="hidden" value="<%=nombre%>"> 
				<input name="p_precio" type="hidden" value="<%=precio%>"> 
				<input name="p_imagen" type="hidden" value="<%=imagen%>"> 
				<input class="cantidad" min="1" name="p_cantidad" type="number" value="1"> 
				<input class="btn-opcion" name="add_wishlist" type="submit" value="Añadir a la Wishlist"> 
				<input class="btn" name="add_carrito" type="submit" value="Añadir al Carrito">
			</form>
			<%
		  	}try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}}
			
			else{
			  		%><p class="vacio">¡Todavía no se han añadido productos!</p><% 
			  	}
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
			%>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="js/script.js">
	</script>
</body>
</html>