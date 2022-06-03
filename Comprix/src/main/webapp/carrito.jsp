<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Carrito de la Compra</title>
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
	<section class="carrito">
		<h1 class="titulo">Productos Añadidos</h1>
		<div class="caja-contenedora">
			<form action="" class="caja" method="post">
				<a class="fa-solid fa-times" href="" onclick="return confirm('¿Eliminar producto del carrito?');"></a> <a class="fa-solid fa-eye" href=""></a> <img alt="Foto del producto" src="">
				<div class="nombre"></div>
				<div class="precio">
					€/-
				</div><input name="carrito_id" type="hidden" value="">
				<div class="flex-btn">
					<input class="cantidad" min="1" name="p_cantidad" type="number" value=""> <input class="btn-opcion" name="actualizar_cantidad" type="submit" value="actualizar">
				</div>
				<div class="sub-total">
					Precio : <span>€/-</span>
				</div>
			</form>
		</div>
		<div class="carrito-total">
			<p>Total : <span>0€/-</span></p><a class="btn-opcion" href="tienda.jsp">Seguir Comprando</a> <a class="btn-eliminar" href="carrito.jsp?">Eliminar Todo</a> <a class="btn" href="checkout.jsp">Comprar</a>
		</div>
	</section>
	<script src="js/script.js">
	</script>
</body>
</html>