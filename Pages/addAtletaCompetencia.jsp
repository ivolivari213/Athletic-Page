

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
	String atleta= request.getParameter("Atleta_atletaId");
	String evento = request.getParameter("competenciaEventos_competenciaEventosId");
	String resultado = request.getParameter("resultado");
	String posicion = request.getParameter("posicion");

	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department

			boolean res=appDBAuth.addAtletaCompetencia( evento,atleta,resultado,posicion);%>





			<%//Verify if the user has been authenticated
			if (res){%>
			<script>alert("No se Pudo agregar una Competencia");
				window.location = "Menu.jsp";
				</script>
			<%}else{

				%>
			<script>alert("Se agrego la competencia exitosamente");
				window.location = "Menu.jsp";
				</script>
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



	</body>
</html>
