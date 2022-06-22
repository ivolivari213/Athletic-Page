

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
	String nivel = request.getParameter("nivel");
	String personaId = request.getParameter("personaId");
	String ninicio= request.getParameter("ninicio");
	String nfinal=request.getParameter("nfinal");


	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department
			boolean res=appDBAuth.addPersonaNivelLicencia(nivel,personaId,ninicio,nfinal);%>



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
