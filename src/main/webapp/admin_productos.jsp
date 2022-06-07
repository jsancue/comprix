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
   <title>Productos</title>
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
	    int pid=Integer.parseInt(request.getParameter("eliminar"));
	    query="DELETE FROM \"comprix\".producto WHERE id = ?";
	    pstm = con.prepareStatement(query);
	    pstm.setInt(1, pid);
	    pstm.execute();
	    query="DELETE FROM \"comprix\".carrito WHERE id_producto = ?";
	    pstm = con.prepareStatement(query);
	    pstm.setInt(1, pid);
	    pstm.execute();
	    query="DELETE FROM \"comprix\".wishlist WHERE id_producto = ?";
	    pstm = con.prepareStatement(query);
	    pstm.setInt(1, pid);
	    pstm.execute();
   }}
   %>
<section class="add-productos">

   <h1 class="titulo">Añadir Productos</h1>

   <form action="/ProductoAñadir" method="POST" enctype="multipart/form-data">
        <div class="flex">

            <div class="inputs">
                <input type="text" name="nombre" class="caja" required placeholder="Introduzca el nombre del producto">
                <select name="categoria" class="caja" required>
                    <option value="" selected disabled>Escoja una categoría</option>
                    <option value="Verdura">Verdura</option>
                    <option value="Fruta">Fruta</option>
                    <option value="Carne">Carne</option>
                    <option value="Pescado">Pescado</option>
                </select>
            </div>

            <div class="inputs">
                <input type="number" min="0" name="precio" class="caja" required placeholder="precio">
                <input type="file" name="imagen" required class="caja" accept="image/jpg, image/jpeg, image/png">
            </div>
        </div>
      <textarea name="detalles" class="caja" required placeholder="detalles" cols="30" rows="10"></textarea>
      <input type="submit" class="btn" value="Añadir Producto" name="add_producto">
   </form>

</section>

<section class="ver-productos">

   <h1 class="titulo">Productos Añadidos</h1>

   <div class="caja-contenedora">
	<%
     query = "SELECT * FROM \"comprix\".producto";
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
		  		Float precio=rs.getFloat(6);
		  		byte[] imagen = rs.getBytes(5);
			  	
		  	%>
		  			<div class="caja">
				        <div class="precio"><%=precio%>€/Kg</div>
				        <img alt="foto producto" src="/CargarImagenProducto?<%=id%>" onerror="this.src='images/default-product-img.jpg';">
				        <div class="nombre"><%=nombre%></div>
				        <div class="categoria"><%=categoria%></div>
				        <div class="detalles"><%=detalles%></div>
				
				        <div class="flex-btn">
				            <a href="admin_productos_actualizar.jsp?actualizar=<%=id%>" class="btn-opcion">Actualizar</a>
				            <a href="admin_productos.jsp?eliminar=<%=id%>" class="btn-eliminar" onclick="return confirm('¿Estás seguro de que quieres eliminar este producto?');">Borrar</a>
				        </div>
    				</div>
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
<script src="js/script.js"></script>
<%request.getSession().setAttribute("mensaje", null); %>
</body>
</html>