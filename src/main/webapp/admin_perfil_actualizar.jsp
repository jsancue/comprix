<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Actualizar Perfil Administrador</title>
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
   <link rel="stylesheet" href="css/componentes.css">

</head>
<body>
   
<jsp:include page="admin_header.jsp" />

<section class="actualizar-perfil">

   <h1 class="titulo">Actualizar perfil</h1>

   <form action="/ActualizarPerfilAdmin" method="POST" enctype="multipart/form-data">
      <img src="/CargarImagenUsuario?<%=request.getSession().getAttribute("id")%>" alt="Foto de perfil" onerror="this.src='images/user_default.jpg';">
      <div class="flex">
         <div class="inputs">
            <span>Nombre:</span>
            <input type="text" name="nombre" value="" placeholder="Actualizar nombre de usuario" class="caja" required >
            <span>Email :</span>
            <input type="email" name="email" value="" placeholder="Actualizar email" required class="caja">
            <span>Actualizar Foto de Perfil :</span>
            <input type="file" name="imagen" accept="image/jpg, image/jpeg, image/png" class="caja">
            <input type="hidden" name="old_image" value="">
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
         <input type="submit" class="btn" value="actualizar perfil" name="actualizar_perfil">
         <a href="admin_index.jsp" class="btn-opcion">Volver</a>
      </div>
   </form>

</section>

<script src="js/script.js"></script>
<%request.getSession().setAttribute("mensaje", null); %>
</body>
</html>