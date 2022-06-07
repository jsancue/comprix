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
	<title>Pedidos</title>
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
PreparedStatement pstm2=null;
String query = "";
ResultSet rs;
ResultSet rs2;

int id_usuario = 0;
if(request.getSession().getAttribute("id")!=null){
	id_usuario = (Integer)request.getSession().getAttribute("id");
}

%>
	<section class="pedidos">
		<h1 class="titulo">Pedidos</h1>
		<div class="caja-contenedora">
		<%	
			query="SELECT * FROM \"comprix\".pedido Where id_usuario = ?";
			try {
				
				pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				pstm.setInt(1, id_usuario);
				rs = pstm.executeQuery();

				rs.last();
			  	int numberOfRows = rs.getRow(); 
			  	rs.beforeFirst();
			  	
			  	if(numberOfRows>0){
				  	while(rs.next()){
				  		int id_direccion = rs.getInt(8);
				  		String sql = "SELECT * FROM \"comprix\".direccion Where id = ?";
				  		pstm2 = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
						pstm2.setInt(1, id_direccion);
						rs2 = pstm2.executeQuery();

						rs2.last();
					  	int numberOfRows2 = rs2.getRow(); 
					  	rs2.beforeFirst();
					  	rs2.next();
		%>	
			<div class="caja">
				<p>Fecha : <span><%=rs.getDate(11)%></span></p>
				<p>Nombre : <span><%=rs.getString(3)%> <%=rs.getString(4)%></span></p>
				<p>Numero : <span><%=rs.getString(5)%></span></p>
				<p>Email : <span><%=rs.getString(6)%></span></p>
				<p>Dirección : <span><%=rs2.getString(3)%></span></p>
				<p>Método de Pago : <span><%=rs.getInt(7)%></span></p>
				<p>Pedido : <span><%=rs.getString(9)%></span></p>
				<p>Precio : <span><%=rs.getString(10)%>€/-</span></p>
				<p>Estado del pago : <span style="color:<%if(rs.getInt(12)==0){%>red<%}else{%>green<% } %>;"><%if(rs.getInt(12)==0){%>Pendiente<%}else{%>Completado<% } %></span></p>
			</div>
			<%
				}try {
					con.close();
					pstm.close();
				} catch (Exception e) {
					e.printStackTrace();
				}}	
				else{
					%><p class="vacio">Aún no has hecho ningún pedido.</p><% 
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