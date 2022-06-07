<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.DateFormat" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Pedidos</title>
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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/admin.css">

</head>
<body>
<jsp:include page="admin_header.jsp" />
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
	
   PreparedStatement pstm = null;
   PreparedStatement pstm2 = null;
   String query = "";
   ResultSet rs;
   ResultSet rs2;
   if (request.getParameter("eliminar")!=null){
   if(Integer.parseInt(request.getParameter("eliminar"))!=0){
	    int pid=Integer.parseInt(request.getParameter("eliminar"));
	    query="DELETE FROM \"comprix\".pedido WHERE id = ?";
	    pstm = con.prepareStatement(query);
	    pstm.setInt(1, pid);
	    pstm.execute();
   }}
   %>

<section class="pedidos">

   <h1 class="titulo">Pedidos</h1>

   <div class="caja-contenedora">
	<%
     query = "SELECT * FROM \"comprix\".pedido";
	try {
		pstm = con.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	  	rs = pstm.executeQuery();
	  	rs.last();
	  	int numberOfRows = rs.getRow(); 
	  	rs.beforeFirst();    
	  	
		if(numberOfRows>0){
		  	while(rs.next()){
		  		int id=rs.getInt(1);
		  		int id_usuario=rs.getInt(2);
		  		String nombre=rs.getString(3);
		  		String apellidos=rs.getString(4);
		  		String telefono=rs.getString(5);
		  		String email=rs.getString(6);
		  		int metodo=rs.getInt(7);
		  		int direccion=rs.getInt(8);
		  		String productos=rs.getString(9);
		  		String precio=rs.getString(10);
		  		java.sql.Date date=rs.getDate(11);
		  		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		  		String dateStr = dateFormat.format(date);
		  		int estado=rs.getInt(12);
		  		
		  		String sql = "SELECT * FROM \"comprix\".direccion Where id = ?";
		  		pstm2 = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				pstm2.setInt(1, direccion);
				rs2 = pstm2.executeQuery();

				rs2.last();
			  	int numberOfRows2 = rs2.getRow(); 
			  	rs2.beforeFirst();
			  	rs2.next();
		  	%>
      <div class="caja">
         <p> Id Usuario: <span><%=id_usuario%></span> </p>
         <p> Fecha: <span><%=dateStr%></span> </p>
         <p> Nombre : <span><%=nombre%> <%=apellidos%></span> </p>
         <p> Email : <span><%=email%></span> </p>
         <p> Teléfono : <span><%=telefono%></span> </p>
         <p> Direccion : <span><%=rs2.getString(4)%> (<%=rs2.getString(5)%>), <%=rs2.getString(6)%><%=rs2.getString(7)%>, <%=rs2.getString(10)%> (<%=rs2.getString(11)%>), <%=rs2.getString(12)%></span> </p>
         <p> Productos : <span><%=productos%></span> </p>
         <p> Precio : <span><%=precio%>€</span> </p>
         <p> Método de pago : <span><%=metodo%></span> </p>
         <form action="/PedidoActualizar" method="POST">
            <input type="hidden" name="id_pedido" value="<%=id%>">
            <select name="actualizar_pago" class="dropdown">
               <option value="<%=estado%>" selected disabled><%if(estado>0){%>Completado<%}else{%>Pendiente<%}%></option>
               <option value="0">Pendiente</option>
               <option value="1">Completado</option>
            </select>
            <div class="flex-btn">
               <input type="submit" name="actualizar_pedido" class="btn-opcion" value="Actualizar">
               <a href="admin_pedidos.jsp?eliminar=<%=id%>" class="btn-eliminar" onclick="return confirm('¿Estás seguro de que quieres eliminar este pedido?');">Eliminar</a>
            </div>
         </form>
      </div>
      <%
		  	}try {
				con.close();
				pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		  	}else{
			  		%><p class="vacio">¡Todavía no hay pedidos!</p><% 
			  	}
			
			 }catch (SQLException e) {
			  		e.printStackTrace();
			 }
		      
			%>

   </div>

</section>

<script src="js/script.js"></script>
<%request.getSession().setAttribute("mensaje", null); %>
</body>
</html>