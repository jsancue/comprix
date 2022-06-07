<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import = "java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
	int tipo =0;
	boolean logueado = false;
	int id_usuario = 0;
	String nombre = "";
	String apellidos = ""; 
	
	if(request.getSession().getAttribute("logueado")!=null){
		logueado = (Boolean) request.getSession().getAttribute("logueado");
		if (logueado){
			id_usuario = (Integer) request.getSession().getAttribute("id");
		}else{		
			response.sendRedirect("/login.jsp");
		}
	}else{
		response.sendRedirect("/login.jsp");
	}
	
	if(request.getSession().getAttribute("mensaje")!=null){ 
		String mensaje = (String) request.getSession().getAttribute("mensaje");
		%>
   		<div class="mensaje">
        	<span><%=mensaje%></span>
         	<i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
    <%}%>
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
		
		
		int prodCarrito=0;
		int prodWishlist=0;
  		query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".carrito WHERE id_usuario=?";
			try {
				pstm = con.prepareStatement(query);
				pstm.setInt(1, id_usuario);
			  	rs = pstm.executeQuery();
			  	
			  	rs.next();
			  	prodCarrito = (rs.getInt("recordCount"));
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
			query = "SELECT COUNT(*) AS recordCount FROM \"comprix\".wishlist WHERE id_usuario=?";
			try {
				pstm = con.prepareStatement(query);
				pstm.setInt(1, id_usuario);
			  	rs = pstm.executeQuery();
			
			  	rs.next();
			  	prodWishlist = (rs.getInt("recordCount"));
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
			
			query = "SELECT * FROM \"comprix\".usuario WHERE id=?";
			try {
				pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				pstm.setInt(1, id_usuario);
			  	rs = pstm.executeQuery();
			  	
			  	rs.last();
			  	int numberOfRows = rs.getRow(); 
			  	rs.beforeFirst();
			  	

			  	if(numberOfRows>0){
				  	while(rs.next()){
				  		nombre = (rs.getString(2));
					  	apellidos = (rs.getString(3));
				  		}
				 }		

			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }

		%>
		
       <div class="iconos">
            <div id="menu-btn" class="fa-solid fa-bars"></div>
            <div id="user-btn" class="fa-solid fa-user"></div>
            <a href="buscar.jsp" class="fa-solid fa-search"></a>
            <a href="wishlist.jsp"><i class="fa-solid fa-heart"></i><span>(<%=prodWishlist %>)</span></a>
            <a href="carrito.jsp"><i class="fa-solid fa-shopping-cart"></i><span>(<%=prodCarrito %>)</span></a>
       </div>

       <div class="perfil">
            <img src='/CargarImagenUsuario?<%=id_usuario%>' alt="Foto de perfil" onerror="this.src='images/user_default.jpg';">
            <p><%=nombre %> <%=apellidos%></p>
            <a href="usuarios_perfil_actualizar.jsp" class="btn">Actualizar perfil</a>
            <a href="logout" class="btn-eliminar">Cerrar Sesión</a>

            <div class="flex-btn">
                <a href="login.jsp" class="btn-opcion">Iniciar Sesión</a>
                <a href="register.jsp" class="btn-opcion">Regístrate</a>
            </div>
       </div>

    </div>
    <%
    try {
			con.close();
			pstm.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
    %>

</header>