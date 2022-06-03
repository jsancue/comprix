<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Sobre Nosotros</title>
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
	<section class="nosotros">
		<div class="fila">
			<div class="caja">
				<img alt="" src="./assets/img/nosotros1.png">
				<h3>¿Por qué Nosotros?</h3>
				<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quisquam, a quod, quis alias eius dignissimos pariatur laborum dolorem ad ullam iure, consequatur autem animi illo odit! Atque quia minima voluptatibus.</p><a class="btn" href="contacto.jsp">Contáctenos</a>
			</div>
			<div class="caja">
				<img alt="" src="./assets/img/nosotros2.png">
				<h3>¿Qué Ofrecemos?</h3>
				<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quisquam, a quod, quis alias eius dignissimos pariatur laborum dolorem ad ullam iure, consequatur autem animi illo odit! Atque quia minima voluptatibus.</p><a class="btn" href="tienda.jsp">Tienda</a>
			</div>
		</div>
	</section>
	<section class="reseñas">
		<h1 class="titulo">Reseñas de los Clientes</h1>
		<div class="caja-contenedora">
			<div class="caja">
				<img alt="foto de stock de una persona" src="./assets/img/foto-1.jpg">
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et voluptates sit earum, neque non cupiditate amet deserunt aperiam quas ex.</p>
				<div class="estrellas">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
				</div>
				<h3>pepe pepito</h3>
			</div>
			<div class="caja">
				<img alt="foto de stock de una persona" src="./assets/img/foto-2.jpg">
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et voluptates sit earum, neque non cupiditate amet deserunt aperiam quas ex.</p>
				<div class="estrellas">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
				</div>
				<h3>pepe pepito</h3>
			</div>
			<div class="caja">
				<img alt="foto de stock de una persona" src="./assets/img/foto-3.jpg">
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et voluptates sit earum, neque non cupiditate amet deserunt aperiam quas ex.</p>
				<div class="estrellas">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
				</div>
				<h3>pepe pepito</h3>
			</div>
			<div class="caja">
				<img alt="foto de stock de una persona" src="./assets/img/foto-4.jpg">
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et voluptates sit earum, neque non cupiditate amet deserunt aperiam quas ex.</p>
				<div class="estrellas">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
				</div>
				<h3>pepe pepito</h3>
			</div>
			<div class="caja">
				<img alt="foto de stock de una persona" src="./assets/img/foto-5.jpg">
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et voluptates sit earum, neque non cupiditate amet deserunt aperiam quas ex.</p>
				<div class="estrellas">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
				</div>
				<h3>pepe pepito</h3>
			</div>
			<div class="caja">
				<img alt="foto de stock de una persona" src="./assets/img/foto-6.jpg">
				<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Et voluptates sit earum, neque non cupiditate amet deserunt aperiam quas ex.</p>
				<div class="estrellas">
					<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
				</div>
				<h3>pepe pepito</h3>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="js/script.js">
	</script>
</body>
</html>