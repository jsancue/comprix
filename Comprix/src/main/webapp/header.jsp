<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import = "java.util.*" %>

<%
	int tipo =0;
	try{
	HttpSession sesion = request.getSession(); 
	int id = (Integer) sesion.getAttribute("id");
	out.println(sesion.getAttribute("id"));
	if (sesion.getAttribute("id")!=null){
		String nombre = (String) sesion.getAttribute("nombre");
		String apellidos = (String) sesion.getAttribute("apellidos");
		tipo = (Integer)sesion.getAttribute("tipo");
		
		if(tipo>0){request.getRequestDispatcher("/admin_index.jsp").forward(request, response);}
		else{response.sendRedirect("/index.jsp");}
		
	}else{
		response.sendRedirect("/login.jsp");
	}}catch(Exception e){
		response.sendRedirect("/login.jsp");
	}

	if(request.getSession().getAttribute("mensaje")!=null){ 
		String mensaje = (String) request.getSession().getAttribute("mensaje");
		%>
   		<div class="mensaje">
        	<span><%=mensaje%></span>
         	<i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
    <%} %>
<header class="header">

    <div class="flex">

       <a href="index.jsp" class="logo">Compri<span>x</span></a>

       <nav class="navbar">
          <a href="index.jsp">Inicio</a>
          <a href="tienda.jsp">Tienda</a>
          <a href="pedidos.jsp">Pedidos</a>
          <a href="nosotros.jsp">Sobre Nosotros</a>
          <a href="contacto.jsp">Contacto</a>
       </nav>

       <div class="iconos">
            <div id="menu-btn" class="fa-solid fa-bars"></div>
            <div id="user-btn" class="fa-solid fa-user"></div>
            <a href="buscar.jsp" class="fa-solid fa-search"></a>
            <a href="wishlist.jsp"><i class="fa-solid fa-heart"></i><span>(0)</span></a>
            <a href="carrito.jsp"><i class="fa-solid fa-shopping-cart"></i><span>(0)</span></a>
       </div>

       <div class="perfil">
            <img src='/CargarImagenUsuario' alt="Foto de perfil">
            <p><%out.println(request.getSession().getAttribute("nombre")); %> <%out.println(request.getSession().getAttribute("apellidos")); %></p>
            <a href="usuarios_perfil_actualizar.jsp" class="btn">Actualizar perfil</a>
            <a href="logout" class="btn-eliminar">Cerrar Sesión</a>

            <div class="flex-btn">
                <a href="login.jsp" class="btn-opcion">Iniciar Sesión</a>
                <a href="register.jsp" class="btn-opcion">Regístrate</a>
            </div>
       </div>

    </div>

</header>