										*
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

	String value= request.getParameter("organizacion");




		   if(request.getParameter("organizacion") != null) {
			if (request.getParameter("organizacion").equals("1" )){
			response.sendRedirect("liga.jsp");
			}
			else if (request.getParameter("organizacion").equals("2" )){
				response.sendRedirect("club.jsp");

			}

			else if (request.getParameter("organizacion").equals("3" )){
				response.sendRedirect("organismo.jsp");

			}


		   }
		   %>
		   else{

				<script>
				alert("No hay seleccion");
				 window.location = "seleccionOrg.html";


				</script>


}		
	</body>
</html>
