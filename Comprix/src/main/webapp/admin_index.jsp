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
   <title>Admin Panel</title>
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
<jsp:include page="admin_header.jsp" />

<section class="dashboard">

   <h1 class="titulo">Panel de Control</h1>

   <div class="caja-contenedora">

      <div class="caja">
      <%String cuentaPedidosPendientes="";
     		query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".pedido WHERE estado=0";
			try {
				pstm = con.prepareStatement(query);
			  	rs = pstm.executeQuery();
			
			  	rs.next();
			  	cuentaPedidosPendientes = String.valueOf(rs.getInt("recordCount"));
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
		 %>
        <h3><%=cuentaPedidosPendientes%></h3>
        <p>Pedidos Pendientes</p>
        <a href="admin_pedidos.jsp" class="btn">Ver pedidos</a>
      </div>

      <div class="caja">
      <%String cuentaPedidosCompletados="";
     		query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".pedido WHERE estado=1";
			try {
				pstm = con.prepareStatement(query);
			  	rs = pstm.executeQuery();
			
			  	rs.next();
			  	cuentaPedidosCompletados = String.valueOf(rs.getInt("recordCount"));
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
		 %>
        <h3><%=cuentaPedidosCompletados%></h3>
        <p>Pedidos Completados</p>
        <a href="admin_pedidos.jsp" class="btn">Ver pedidos</a>
      </div>

      <div class="caja">
      	<%String cuentaPedidos="";
     		query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".pedido";
			try {
				pstm = con.prepareStatement(query);
			  	rs = pstm.executeQuery();
			
			  	rs.next();
			  	cuentaPedidos = String.valueOf(rs.getInt("recordCount"));
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		 %>
        <h3><%=cuentaPedidos %></h3>
        <p>Pedidos</p>
        <a href="admin_pedidos.jsp" class="btn">Ver pedidos</a>
      </div>

      <div class="caja">
      	<%String cuentaProductos="";
     		query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".producto";
			try {
				pstm = con.prepareStatement(query);
			  	rs = pstm.executeQuery();
			
			  	rs.next();
			  	cuentaProductos = String.valueOf(rs.getInt("recordCount"));
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
		 %>
        <h3><%=cuentaProductos%></h3>
        <p>Productos Añadidos</p>
        <a href="admin_productos.jsp" class="btn">Ver productos</a>
      </div>

      <div class="caja">
            <%String cuentaCuentas="";
     		query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".usuario";
			try {
				pstm = con.prepareStatement(query);
			  	rs = pstm.executeQuery();
			
			  	rs.next();
			  	cuentaCuentas = String.valueOf(rs.getInt("recordCount"));
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
		 %>
        <h3><%=cuentaCuentas %></h3>
        <p>Cuentas</p>
        <a href="admin_usuarios.jsp" class="btn">Ver cuentas</a>
      </div>

      <div class="caja">
      <%String cuentaAdmins="";
     	query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".usuario WHERE tipo=1";
		try {
			pstm = con.prepareStatement(query);
		  	rs = pstm.executeQuery();
		
		  	rs.next();
		  	cuentaAdmins = String.valueOf(rs.getInt("recordCount"));
		
		 }catch (SQLException e) {
		  		e.printStackTrace();
		 }
		      
		 %>
        <h3><%=cuentaAdmins %></h3>
        <p>Admins</p>
        <a href="admin_usuarios.jsp" class="btn">Ver cuentas</a>
      </div>

      <div class="caja">
            <%String cuentaUsuarios="";
     		 query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".usuario WHERE tipo=0";
		     try {
		  		pstm = con.prepareStatement(query);
		  		rs = pstm.executeQuery();
		
		  		rs.next();
		  		cuentaUsuarios = String.valueOf(rs.getInt("recordCount"));
		
		  	} catch (SQLException e) {
		  		e.printStackTrace();
		  	}
		      
		 %>
        <h3><%=cuentaUsuarios %></h3>
        <p>Usuarios</p>
        <a href="admin_usuarios.jsp" class="btn">Ver cuentas</a>
      </div>

      <div class="caja">
      <%String cuentaMensajes="";
      query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".mensaje";
      try {
  		pstm = con.prepareStatement(query);
  		rs = pstm.executeQuery();

  		rs.next();
  		cuentaMensajes = String.valueOf(rs.getInt("recordCount"));

  	} catch (SQLException e) {
  		e.printStackTrace();
  	}
      
      %>
        <h3><%=cuentaMensajes %></h3>
        <p>Mensajes</p>
        <a href="admin_mensajes.jsp" class="btn">Ver mensajes</a>
      </div>

   </div>

</section>
<%
		try {
  			con.close();
  			pstm.close();
  		} catch (Exception e) {
  			e.printStackTrace();
 		}
%>
<script src="js/script.js"></script>

</body>
</html>