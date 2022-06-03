<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Checkout</title>
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
	<section class="mostrar-pedidos">
		<div class="total">
			Total : <span>$0/-</span>
		</div>
	</section>
	<section class="comprar-pedido">
		<form action="" method="post">
			<h3>Pedido</h3>
			<div class="flex">
				<div class="inputs">
					<span>Nombre:</span> <input class="caja" name="nombre" placeholder="Nombre" required="" type="text">
				</div>
				<div class="inputs">
					<span>Nº Teléfono :</span> <input class="caja" name="numero" placeholder="Número de teléfono" required="" type="number">
				</div>
				<div class="inputs">
					<span>Email :</span> <input class="caja" name="email" placeholder="Email" required="" type="email">
				</div>
				<div class="inputs">
					<span>Método de pago :</span> <select class="caja" name="metodo" required="">
						<option value="contrareembolso">
							Contra Reembolso
						</option>
						<option value="tarjetacredito">
							Tarjeta de Crédito
						</option>
						<option value="paytm">
							Paytm
						</option>
						<option value="paypal">
							Paypal
						</option>
					</select>
				</div>
				<div class="inputs">
					<span>Dirección :</span> <select class="caja" id="direccion" name="direccion" required="">
						<option value="99999">
							Selecione una Dirección
						</option>
					</select>
				</div>
			</div><input class="btn" name="pedido" type="submit" value="Pedir">
		</form>
	</section>
	<jsp:include page="footer.jsp" />
	<script src="js/script.js">
	</script>
</body>
</html>