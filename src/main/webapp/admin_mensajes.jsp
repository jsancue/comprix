<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Mensajes</title>
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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/admin.css">

</head>
<body>
<jsp:include page="admin_header.jsp" />
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
   if (request.getParameter("eliminar")!=null){
   if(Integer.parseInt(request.getParameter("eliminar"))!=0){
	    int id_mensaje=Integer.parseInt(request.getParameter("eliminar"));
	    query="DELETE FROM \"comprix\".mensaje WHERE id = ?";
	    pstm = con.prepareStatement(query);
	    pstm.setInt(1, id_mensaje);
	    pstm.execute();
   }}
   %>

<section class="mensajes">

   <h1 class="titulo">Mensajes</h1>

   <div class="caja-contenedora">
	<%
    query = "SELECT * FROM \"comprix\".mensaje";
	try {
		pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	  	rs = pstm.executeQuery();
	  	
	  	rs.last();
	  	int numberOfRows = rs.getRow(); 
	  	rs.beforeFirst();    
	  	
		if(numberOfRows>0){
		  	while(rs.next()){
		  		int id=rs.getInt(1);
		  		int id_usuario=rs.getInt(2);
		  		String nombre=rs.getString(3);
		  		String apellidos=rs.getString(7);
		  		String email=rs.getString(4);
		  		String telefono=rs.getString(5);
		  		String mensaje=rs.getString(6);
			  	
		 %>
        <div class="caja">
            <p> Id Usuario: <span><%=id_usuario%></span> </p>
            <p> Nombre : <span><%=nombre%> <%=apellidos%></span> </p>
            <p> Teléfono : <span><%=telefono%></span> </p>
            <p> Email : <span><%=email%></span> </p>
            <p> Mensaje : <span> <%=mensaje%></span> </p>
            <a href="admin_mensajes.jsp?eliminar=<%=id%>" onclick="return confirm('¿Estás seguro de que quieres eliminar este mensaje?');" class="btn-eliminar" class="btn-eliminar">Eliminar</a>
        </div>
		<%
	 	}try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	 	}	
		else{
			%><p class="vacio">¡Todavía no hay mensajes!</p><% 
		}
		
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
			%>
   </div>

</section>

<script src="js/script.js"></script>
<%request.getSession().setAttribute("mensaje", null); %>
</body>
</html>