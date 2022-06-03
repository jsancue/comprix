<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	int id = (Integer)request.getSession().getAttribute("id");
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

        <a href="admin_index.jsp" class="logo">Admin<span>Panel</span></a>

        <nav class="navbar">
            <a href="admin_index.jsp">Inicio</a>
            <a href="admin_productos.jsp">Productos</a>
            <a href="admin_pedidos.jsp">Pedidos</a>
            <a href="admin_usuarios.jsp">Usuarios</a>
            <a href="admin_mensajes.jsp">Mensajes</a>
        </nav>

        <div class="iconos">
            <div id="menu-btn" class="fa-solid fa-bars"></div>
            <div id="user-btn" class="fa-solid fa-user"></div>
        </div>

        <div class="perfil">
            <!--TODO PONER CODIGO JSP-->
            <img src="cargarfotoperfil" alt="Foto de perfil">
            <p>Nick</p>
            <a href="admin_perfil_actualizar.jsp" class="btn">Actualizar perfil</a>
            <a href="logout" class="btn-eliminar">Cerrar Sesión</a>

            <div class="flex-btn">
                <a href="login.jsp" class="btn-opcion">Iniciar Sesión</a>
                <a href="register.jsp" class="btn-opcion">Regístrate</a>
            </div>
        </div>

    </div>

</header>