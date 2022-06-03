<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="footer">
    <section class="caja-contenedor">
        
        <div class="caja">
            <h3>Enlaces Rápidos</h3>
            <a href="index.jsp"><i class="fa-solid fa-angle-right"></i> Inicio</a>
            <a href="tienda.jsp"><i class="fa-solid fa-angle-right"></i> Tienda</a>
            <a href="nosotros.jsp"><i class="fa-solid fa-angle-right"></i> Sobre Nosotros</a>
            <a href="contacto.jsp"><i class="fa-solid fa-angle-right"></i> Contacto</a>
        </div>

        <div class="caja">
            <h3>Enlaces Útiles</h3>
            <a href="carrito.jsp"><i class="fa-solid fa-angle-right"></i> Carrito</a>
            <a href="wishlist.jsp"><i class="fa-solid fa-angle-right"></i> Lista de Deseos</a>
            <a href="login.jsp"><i class="fa-solid fa-angle-right"></i> Iniciar Sesión</a>
            <a href="register.jsp"><i class="fa-solid fa-angle-right"></i> Registrarse</a>
        </div>

        <div class="caja">
            <h3>Información</h3>
            <p><i class="fa-solid fa-phone"></i>956 12 34 56</p>
            <p><i class="fa-solid fa-phone"></i>956 11 22 33</p>
            <p><i class="fa-solid fa-envelope"></i>jsancue2103@gmail.com</p>
            <p><i class="fa-solid fa-map-marker-alt"></i>Cádiz, España - 11500</p>
        </div>

        <div class="caja">
            <h3>Síguenos</h3>
            <a href="javascript:void(0)"><i class="fa-brands fa-facebook-f"></i>Facebook</a>
            <a href="javascript:void(0)"><i class="fa-brands fa-twitter"></i>Twitter</a>
            <a href="javascript:void(0)"><i class="fa-brands fa-instagram"></i>Instagram</a>
            <a href="javascript:void(0)"><i class="fa-brands fa-linkedin"></i>LinkedIn</a>
        </div>
	<%request.getSession().setAttribute("mensaje", null); %>
    </section>
</footer>