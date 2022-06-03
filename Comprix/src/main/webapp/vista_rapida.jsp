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
	<title>Vista Rápida</title>
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
	<!-- font awesome cdn link  -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
	<!-- custom css file link  -->
	<link href="css/styles.css" rel="stylesheet">
</head>
<body>
<%
HttpSession sesion = request.getSession(); 

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
	<section class="vista-rapida">
		<h1 class="titulo">Vista Rápida</h1>
		<%
		if (request.getParameter("pid")!=null || request.getParameter("pid")!=""){
			int pid=Integer.parseInt(request.getParameter("pid"));
			query="SELECT * FROM \"comprix\".producto WHERE id = ?";
			try {
				pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				pstm.setInt(1, pid);
				rs = pstm.executeQuery();
				
				rs.last();
			  	int numberOfRows = rs.getRow(); 
			  	rs.beforeFirst();
			  	
			  	if(numberOfRows>0){
				  	while(rs.next()){
				  		int id=rs.getInt(1);
				  		String nombre=rs.getString(2);
				  		String detalles=rs.getString(4);
				  		Float precio=rs.getFloat(6);
				  		byte[] imagen = rs.getBytes(5);
		
		%>
		<form action="" class="caja" method="post">
			<div class="precio"><span><%=precio%></span>€/Kg</div>
			<img alt="Foto del producto" src="">
			<div class="nombre"><%=nombre%></div>
			<div class="detalles"><%=detalles%></div>
			<input name="pid" type="hidden" value="<%=id%>"> 
			<input name="p_nombre" type="hidden" value="<%=nombre%>">
			 <input name="p_precio" type="hidden" value="<%=precio%>"> 
			 <input name="p_imagen" type="hidden" value=""> 
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
					%><p class="vacio">Error, no se ha encontrado el producto, porfavor contacte con el soporte.</p><% 
				}	
			}catch (SQLException e) {
				e.printStackTrace();
			}}else{
				response.sendRedirect("tienda.jsp");
			}
			%>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="js/script.js">
	</script>
</body>
</html>