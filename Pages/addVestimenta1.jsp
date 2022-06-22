<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%//Import the java.sql package to use the ResultSet class %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Arrays"%>
<html>
	<head>
		<title>Your first web form!</title>
	</head>
	<body>

<%
 String [] vestimenta = request.getParameterValues("idVestimenta[]");
for(int i = 0; i < vestimenta.length; i++){
    System.out.println("Valor [" + i + "] = " +Arrays.toString(vestimenta));
}
	//Retrieve variables
	String atleta= request.getParameter("Atleta_atletaId");
	//String vestimenta= request.getParameterValues("idVestimenta[]");
	String fecha= request.getParameter("fecha");
	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department

			boolean res=appDBAuth.addVestimenta(atleta,vestimenta,fecha);%>





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
