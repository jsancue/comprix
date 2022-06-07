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
	<title>Checkout</title>
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
   %>
	<section class="mostrar-pedidos">
	<%
	float total_carrito = 0;
	float total = 0;
     query = "SELECT * FROM \"comprix\".carrito WHERE id_usuario= ?";
	try {
		pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		pstm.setInt(1, (Integer)request.getSession().getAttribute("id"));
	  	rs = pstm.executeQuery();
	  	
	  	rs.last();
	  	int numberOfRows = rs.getRow(); 
	  	rs.beforeFirst();    
	  	
		if(numberOfRows>0){
		  	while(rs.next()){
		  		total_carrito= (rs.getFloat(7) * rs.getInt(5));
			  	total += total_carrito;
		  	%>
			<p> <%=rs.getString(4)%> <span>(<%=rs.getFloat(7) %>€/- x <%=rs.getInt(5) %>)</span> </p>
		<%
		  	}}
			
			else{
			  		%><p class="vacio">¡Todavía no se han añadido productos!</p><% 
			  	}
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
			%>
			<div class="total">Total : <span><%=total %>€/-</span></div>
	</section>
	<section class="comprar-pedido">
		<form action="/Checkout" method="post">
			<h3>Pedido</h3>
			<div class="flex">
				<div class="inputs">
					<span>Nombre:</span> 
					<input class="caja" name="nombre" placeholder="Nombre" required="" type="text">
				</div>
				<div class="inputs">
					<span>Apellidos:</span> 
					<input class="caja" name="apellidos" placeholder="Apellidos" required="" type="text">
				</div>
				<div class="inputs">
					<span>Nº Teléfono :</span> 
					<input class="caja" name="numero" placeholder="Número de teléfono" required="" type="number">
				</div>
				<div class="inputs">
					<span>Email :</span> 
					<input class="caja" name="email" placeholder="Email" required="" type="email">
				</div>
				<div class="inputs">
					<span>Método de pago :</span> 
					<select class="caja" name="metodo" required="">
						<option value="1">
							Contra Reembolso
						</option>
						<option value="2">
							Tarjeta de Crédito
						</option>
						<option value="3">
							Paytm
						</option>
						<option value="4">
							Paypal
						</option>
					</select>
				</div>
				<div class="inputs">
					<span>Dirección :</span> 
					<select class="caja" id="direccion" name="direccion" required="">
					<option value="" selected disabled>Selecione una Dirección</option>
					<%
				     query = "SELECT * FROM \"comprix\".direccion WHERE id_usuario= ?";
					try {
						pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
						pstm.setInt(1, (Integer)request.getSession().getAttribute("id"));
					  	rs = pstm.executeQuery();
					  	
					  	rs.last();
					  	int numberOfRows = rs.getRow(); 
					  	rs.beforeFirst();    
					  	
						if(numberOfRows>0){
						  	while(rs.next()){
						  	%><option value="<%=rs.getInt(1)%>"><%=rs.getString(3) %></option><%
						  	}}
						else{
							%><option value="" disabled>Aún no has añadido una dirección.</option><%
						}
							
							 }catch (SQLException e) {
							  		e.printStackTrace();
							 }
						      
						%>
					</select>
				</div>
			</div><input class="btn" name="pedido" type="submit" value="Pedir">
		</form>
	</section>
	<%
	try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}%>
	<jsp:include page="footer.jsp" />
	<script src="js/script.js">
	</script>
</body>
</html>