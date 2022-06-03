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
   <title>Actualizar Productos</title>
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
   <%
	Connection con = null;
	String usuario = "a21_jsancue";
	String pass = "a21_jsancue";
	String url = "jdbc:postgresql://ns3034756.ip-91-121-81.eu:5432/a21_jsancue";
	int pid=0;
	
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
<body>

<jsp:include page="admin_header.jsp" />

<section class="actualizar-producto">

   <h1 class="titulo">Actualizar Producto</h1>   
	<%if(Integer.parseInt(request.getParameter("actualizar"))!=0){
	    pid=Integer.parseInt(request.getParameter("actualizar"));
	    query="SELECT * FROM \"comprix\".producto WHERE id = ?";
	    pstm = con.prepareStatement(query);
	    pstm.setInt(1, pid);
	    pstm.execute();
  		rs = pstm.executeQuery();
  		if(rs!=null){
  			while(rs.next()){
		%>
		   <form action="ProductoActualizar" method="post" enctype="multipart/form-data">
		      <input type="hidden" name="old_imagen" value="">
		      <input type="hidden" name="pid" value="<%=pid%>">
		      <img src="" alt="">
		      <input type="text" name="nombre" placeholder="Nombre del producto" required class="caja" value="<%=rs.getString(2)%>">
		      <input type="number" name="precio" min="0" placeholder="Precio del producto" required class="caja" value="<%=rs.getFloat(6)%>">
		      <select name="categoria" class="caja" required>
		         <option selected><%=rs.getString(3)%></option>
		         <option value="Verdura">Verdura</option>
		         <option value="Fruta">Fruta</option>
		         <option value="Carne">Carne</option>
		         <option value="Pescado">Pescado</option>
		      </select>
		      <textarea name="detalles" required placeholder="Detalles del producto" class="caja" cols="30" rows="10"><%=rs.getString(4)%></textarea>
		      <input type="file" name="imagen" class="caja" accept="image/jpg, image/jpeg, image/png">
		      <div class="flex-btn">
		         <input type="submit" class="btn" value="Actualizar Producto" name="actualizar_producto">
		         <a href="admin_productos.jsp" class="btn-opcion">Volver</a>
		      </div>
		   </form>
		<%}} else{%><p class="vacio">No se ha encontrado el producto.</p><%}
  		}%>
</section>

<script src="js/script.js"></script>

</body>
</html>