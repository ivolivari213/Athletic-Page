<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%//Import the java.sql package to use the ResultSet class %>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>Your first web form!</title>
	</head>
	<body>


<%

	String value= request.getParameter("persona");




		   if(request.getParameter("persona") != null) {
			if (request.getParameter("persona").equals("1" )){
			response.sendRedirect("persona.jsp");
			}
			else if (request.getParameter("persona").equals("2" )){
				response.sendRedirect("persona1.jsp");

			}




		   }
		   %>
		   else{

				<script>
				alert("No hay seleccion");
				 window.location = "seleccionPer.html";


				</script>


}
