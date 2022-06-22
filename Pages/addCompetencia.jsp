

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
	//Retrieve variables
	String ncompetencia = request.getParameter("ncompetencia");
	String fecha = request.getParameter("fecha");
	String lugar = request.getParameter("lugar");
	String organizacion_lorganizacionLiga = request.getParameter("organizacion_lorganizacionLiga");
	String redirect = "competenciaEvento.jsp";




	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department

			boolean res=appDBAuth.addCompetencia( organizacion_lorganizacionLiga , ncompetencia,fecha, lugar);%>




			<%//Verify if the user has been authenticated
			if (res){%>
				<script>alert("no Se agregaron exitosamente los datos");
				window.location = "Menu.jsp";
				</script>
			<%}else{
				//Close any session associated with the user
				response.sendRedirect(redirect);
				%>

			<%}

				//Close the connection to the database
				appDBAuth.close();

			} catch(Exception e)
			{%>
				Nothing to show!
				<%e.printStackTrace();
			}finally{
				System.out.println("Finally");
			}
			%>
		sessionName=<%=session.getAttribute("competenciaEvento.jsp")%>



	</body>
</html>
