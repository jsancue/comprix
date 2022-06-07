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
	<title>Carrito de la Compra</title>
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
	<!-- css link  -->
	<link href="css/styles.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
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

int id_usuario = 0;
if(request.getSession().getAttribute("id")!=null){
	id_usuario = (Integer)request.getSession().getAttribute("id");
}

if (request.getParameter("eliminar")!=null){
	if(Integer.parseInt(request.getParameter("eliminar"))!=0){
		int id_carrito=Integer.parseInt(request.getParameter("eliminar"));
		query="DELETE FROM \"comprix\".carrito WHERE id = ?";
		pstm = con.prepareStatement(query);
		pstm.setInt(1, id_carrito);
		pstm.execute();
	}
}

if (request.getParameter("borrar_todo")!=null){
	query="DELETE FROM \"comprix\".carrito WHERE id_usuario = ?";
	pstm = con.prepareStatement(query);
	pstm.setInt(1, id_usuario);
	pstm.execute();
}

%>
	<section class="carrito">
		<h1 class="titulo">Productos Añadidos</h1>
		<div class="caja-contenedora">
		<%	
			float total=0;
		   	float subtotal=0;
			query="SELECT * FROM \"comprix\".carrito Where id_usuario = ?";
			try {
				
				pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				pstm.setInt(1, id_usuario);
				rs = pstm.executeQuery();

				rs.last();
			  	int numberOfRows = rs.getRow(); 
			  	rs.beforeFirst();
			  	
			  	if(numberOfRows>0){
				  	while(rs.next()){
				  		int id=rs.getInt(1);
				  		int pid=rs.getInt(3);
				  		String nombre=rs.getString(4);
				  		int cantidad = rs.getInt(5);
				  		Float precio=rs.getFloat(7);
				  		byte[] imagen = rs.getBytes(6);
				  		subtotal=precio*(float)cantidad;
		
		%>
			<form action="/ActualizarCarrito" class="caja" method="post">
				<a class="fa-solid fa-times" href="carrito.jsp?eliminar=<%=id%>" onclick="return confirm('¿Eliminar producto del carrito?');"></a> 
				<a class="fa-solid fa-eye" href="vista_rapida.jsp?pid=<%=pid%>"></a> 
				<img alt="foto producto" src="/CargarImagenProducto?<%=pid%>" onerror="this.src='images/default-product-img.jpg';">
				<div class="nombre"><%=nombre%></div>
				<div class="precio"><%=precio%>€/-</div>
				<input name="carrito_id" type="hidden" value="<%=id%>">
				<div class="flex-btn">
					<input class="cantidad" min="1" name="p_cantidad" type="number" value="<%=cantidad%>"> 
					<input class="btn-opcion" name="actualizar_cantidad" type="submit" value="Actualizar">
				</div>
				<div class="sub-total">
					Precio : <span><%=subtotal %>€/-</span>
				</div>
			</form>
				<%
				total += subtotal;
				}try {
					con.close();
					pstm.close();
				} catch (Exception e) {
					e.printStackTrace();
				}}	
				else{
					%><p class="vacio">Tu carrito está vacío.</p><% 
				}	
			}catch (SQLException e) {
				e.printStackTrace();
			}
			%>
		</div>
		<div class="carrito-total">
			<p>Total : <span><%=total%>€/-</span></p>
			<a class="btn-opcion" href="tienda.jsp">Seguir Comprando</a> 
			<a class="btn-eliminar <%if(total<1){%>deshabilitar<%} %>" href="carrito.jsp?borrar_todo"">Eliminar Todo</a>
			 <a class="btn" href="checkout.jsp">Comprar</a>
		</div>
	</section>
	<script src="js/script.js">
	</script>
</body>
</html>