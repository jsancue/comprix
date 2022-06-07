<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import = "java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
	int tipo =0;
	int id_usuario=0;
	boolean logueado = false;
	String nombre = "";
	String apellidos = "";
	
	try{
	logueado = (Boolean) request.getSession().getAttribute("logueado");
	if (logueado){
		tipo = (Integer)request.getSession().getAttribute("tipo");
		id_usuario = (Integer)request.getSession().getAttribute("id");
		if(tipo<1){request.getRequestDispatcher("/index.jsp").forward(request, response);}
	}else{		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
	
	if(request.getSession().getAttribute("mensaje")!=null){ 
		String mensaje = (String) request.getSession().getAttribute("mensaje");
		%>
   		<div class="mensaje">
        	<span><%=mensaje%></span>
         	<i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
    <%}} catch(Exception e){
    	request.getRequestDispatcher("/login.jsp").forward(request, response);
    	}%>
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
			
			query = "SELECT * FROM \"comprix\".usuario WHERE id=? AND tipo=1";
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
        </div>

        <div class="perfil">
           
            <img src="/CargarImagenUsuario?<%=id_usuario%>" alt="Foto de perfil" onerror="this.src='images/user_default.jpg';">
            <p><%=nombre%> <%=apellidos %></p>
            <a href="admin_perfil_actualizar.jsp" class="btn">Actualizar perfil</a>
            <a href="logout" class="btn-eliminar">Cerrar Sesión</a>

            <div class="flex-btn">
                <a href="login.jsp" class="btn-opcion">Iniciar Sesión</a>
                <a href="register.jsp" class="btn-opcion">Regístrate</a>
            </div>
        </div>

    </div>

</header>