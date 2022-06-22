

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
	String Pueblo_idPueblo = request.getParameter("Pueblo_idPueblo");
	String organizacionNombre = request.getParameter("organizacionNombre");
	String organizacionRegistroDptoEstado = request.getParameter("organizacionRegistroDptoEstado");
	String organizacionTelefono = request.getParameter("organizacionTelefono");
	String organizacionDireccionFisica = request.getParameter("organizacionDireccionFisica");
	String organizacionCorreoElectronico= request.getParameter("organizacionCorreoElectronico");
	String organizacionPaginaWeb = request.getParameter("organizacionPaginaWeb");
	String organizacionDireccionPostal = request.getParameter("organizacionDireccionPostal");
	String organizacionReglamentoUrl = request.getParameter("organizacionReglamentoUrl");





	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department

			boolean res=appDBAuth.addClub( Pueblo_idPueblo, organizacionNombre,organizacionRegistroDptoEstado, organizacionTelefono,  organizacionDireccionFisica, organizacionCorreoElectronico, organizacionPaginaWeb, organizacionDireccionPostal, organizacionReglamentoUrl);%>




			<%//Verify if the user has been authenticated
			if (res){%>
					<script>alert("No Se agregaron exitosamente los datos");
				window.location = "Menu.jsp";
				</script>
			<%}else{
				
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

		<%
	//Retrieve variables
	String organizacion_lorganizacionLiga = request.getParameter("organizacion_lorganizacionLiga");
	String clubLigaFechaInicio = request.getParameter("clubLigaFechaInicio");
	String clubLigaFechaFin = request.getParameter("clubLigaFechaFin");
	String organizacion_lorganizacionClub= request.getParameter("organizacion_lorganizacionClub");





	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department

			boolean res=appDBAuth.addClub1( organizacion_lorganizacionClub, organizacion_lorganizacionLiga,  clubLigaFechaInicio, clubLigaFechaFin );%>




			<%//Verify if the user has been authenticated
			if (res){%>
					<script>alert("No Se agregaron exitosamente los datos");
				window.location = "Menu.jsp";
				</script>
			<%}else{
				
				%>
					<script>alert("Se agregaron exitosamente los datos");
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
