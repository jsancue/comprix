<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Contacto</title>
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
	<section class="contacto">
		<h1 class="titulo">Contacte con Nosotros</h1>
		<form action="/EnviarMensaje" method="post">
			<input class="caja" name="nombre" placeholder="Nombre" required="" type="text">
			<input class="caja" name="apellidos" placeholder="Apellidos" required="" type="text">
			<input class="caja" name="email" placeholder="Email" required="" type="email"> 
			<input class="caja" min="0" name="telefono" placeholder="Número de Teléfono" required="" type="number"> 
			<textarea class="caja" cols="30" name="mensaje" placeholder="Mensaje" required="" rows="10"></textarea> 
			<input class="btn" name="enviar" type="submit" value="Enviar Mensaje">
		</form>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="js/script.js">
	</script>
</body>
</html>