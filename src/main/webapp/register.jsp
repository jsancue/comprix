<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Registrarse</title>
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
	<!--font awesome cdn link-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
	<!--css-->
	<link href="css/componentes.css" rel="stylesheet">
</head>
<body>
	<%if(request.getSession().getAttribute("mensaje")!=null){ 
		String mensaje = (String) request.getSession().getAttribute("mensaje");
		%>
   		<div class="mensaje">
        	<span><%=mensaje %></span>
         	<i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
    <%} %>
	<section class="form-container">
		<form action="/Register" enctype="multipart/form-data" method="post">
			<h3>Regístrate Ahora</h3>
			<div class="form-grupo">
				<input class="caja" id="nombre" name="nombre" placeholder="Introduzca su nombre" required="" type="text">
			</div>
			<div class="form-grupo">
				<input class="caja" id="apellidos" name="apellidos" placeholder="Introduzca sus apellidos" required="" type="text">
			</div>
			<div class="form-grupo">
				<input class="caja" id="email" name="email" placeholder="Introduzca su email" required="" type="email">
			</div>
			<div class="form-grupo">
				<input class="caja" id="password" name="password" placeholder="Introduzca su contraseña" required="" type="password">
			</div>
			<div class="form-grupo">
				<input class="caja" id="cpassword" name="cpassword" placeholder="Confirme la contraseña" required="" type="password">
			</div>
			<div class="form-grupo">
				<input accept="image/jpg" class="caja" id="imagen" name="imagen" required="" type="file">
			</div>
			<input class="btn" name="submit" type="submit" value="registrarse">
			<p>¿Ya tienes una cuenta? <a href="login.jsp">Login</a></p>
		</form>
	</section>
</body>
</html>