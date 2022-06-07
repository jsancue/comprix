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
	<title>Actualizar Perfil Usuario</title>
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
	<link href="css/componentes.css" rel="stylesheet">
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
   if (request.getParameter("eliminar")!=null){
   if(Integer.parseInt(request.getParameter("eliminar"))!=0){
	    int pid=Integer.parseInt(request.getParameter("eliminar"));
	    query="DELETE FROM \"comprix\".direccion WHERE id = ?";
	    pstm = con.prepareStatement(query);
	    pstm.setInt(1, pid);
	    pstm.execute();
   }}
   %>
	<section class="actualizar-perfil">
		<h1 class="titulo">Actualizar perfil</h1>
		<form action="/ActualizarPerfil" enctype="multipart/form-data" method="post">
			<img alt="Foto de perfil" src="/CargarImagenUsuario?<%=request.getSession().getAttribute("id")%>" onerror="this.src='images/user_default.jpg';">
			<div class="flex">
				<div class="inputs">
					<span>Nombre:</span> 
					<input class="caja" name="nombre" placeholder="Actualizar nombre" required="" type="text" value=""> 
					<span>Email :</span> 
					<input class="caja" name="email" placeholder="Actualizar email" required="" type="email" value=""> 
					<span>Actualizar Foto de Perfil :</span> 
					<input accept="image/jpg, image/jpeg, image/png" class="caja" name="imagen" type="file"> 
					<input name="old_image" type="hidden" value="">
				</div>
				<div class="inputs">
					<span>Apellidos :</span> 
					<input class="caja" name="apellidos" placeholder="Actualizar apellidos" type="text"> 
					<span>Nueva contraseña :</span> 
					<input class="caja" name="new_pass" placeholder="Introduzca la nueva contraseña" type="password"> 
					<span>Confirmar contraseña :</span> 
					<input class="caja" name="c_pass" placeholder="Confirma la nueva contraseña" type="password">
				</div>
			</div>
			<div class="flex-btn">
				<input class="btn" name="actualizar_perfil" type="submit" value="actualizar perfil"> <a class="btn-opcion" href="index.jsp">Volver</a>
			</div>
		</form>
		<br>
		<br>
		<h1 class="titulo">Añadir Dirección</h1>
		<form action="/AñadirDireccion" method="post">
			<div class="flex">
				<div class="inputs">
					<span>Calle 1:</span> 
					<input class="caja" name="calle" placeholder="Nombre de la calle" required="" type="text" value=""> 
					<span>Número:</span> 
					<input class="caja" name="num" placeholder="Numero" type="number" value=""> 
					<span>País:</span> 
					<input class="caja" name="pais" placeholder="País" type="text"> 
					<span>Provincia:</span> 
					<input class="caja" name="provincia" placeholder="Provincia" type="text"> 
					<span>Detalles</span> 
					<input class="caja" name="detalles" placeholder="Detalles" type="textarea">
				</div>
				<div class="inputs">
					<span>Calle 2:</span> 
					<input class="caja" name="calle2" placeholder="Nombre de la calle 2 (opcional)" type="text" value=""> 
					<span>Letra:</span> 
					<input class="caja" name="letra" placeholder="Letra" type="text" value=""> 
					<span>Ciudad:</span> 
					<input class="caja" name="ciudad" placeholder="Ciudad" required="" type="text" value=""> 
					<span>Código Postal:</span> 
					<input class="caja" name="c_postal" placeholder="Código Postal" type="text">
					<span>Alias:</span> 
					<input class="caja" name="alias" placeholder="Alias" type="text">
				</div>
			</div>
			<div class="flex-btn">
				<input class="btn" name="añadir_direccion" type="submit" value="Añadir Dirección"> <a class="btn-opcion" href="index.jsp">Volver</a>
			</div>
		</form>
		
		<br>
		<br>
		<h1 class="titulo">Direcciones</h1>
		<%
     query = "SELECT * FROM \"comprix\".direccion WHERE id_usuario=?";
	try {
		pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		pstm.setInt(1, (Integer) request.getSession().getAttribute("id"));
	  	rs = pstm.executeQuery();
	  	
	  	rs.last();
	  	int numberOfRows = rs.getRow(); 
	  	rs.beforeFirst();    
	  	
		if(numberOfRows>0){
		  	while(rs.next()){
		  		int id=rs.getInt(1);
		  		String alias=rs.getString(3);
		  	%>
		  			<form action="" method="post">
			  			<div class="flex">
				  			<div class="inputs">
						        <span>Alias: <%=alias %></span>
						
						        <div class="flex-btn">
						            <a href="usuarios_perfil_actualizar.jsp?eliminar=<%=id%>" class="btn-eliminar" onclick="return confirm('¿Estás seguro de que quieres eliminar esta dirección?');">Borrar</a>
						        </div>
						    </div>
					    </div>    
    				</form>
    		<%
		  	}try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}}
			
			else{
			  		%><p class="vacio">¡Todavía no has añadido una dirección!</p><% 
			  	}
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
			%>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="js/script.js">
	</script>
</body>
</html>