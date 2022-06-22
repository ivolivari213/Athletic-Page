

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
	String Atleta_atletaId = request.getParameter("Atleta_atletaId");
	String fisica = request.getParameter("fisica");
	String Pueblo_idPueblo = request.getParameter("Pueblo_idPueblo");
	String fecha= request.getParameter("fecha");


	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department

			boolean res=appDBAuth.addAtletaPueblo( Atleta_atletaId, Pueblo_idPueblo,  fisica, fecha );%>


			<%//Verify if the user has been authenticated
			if (res){%>
				<script>alert("No se Pudo agregar un Atleta");
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
	String Atleta_atletaId1 = request.getParameter("Atleta_atletaId");
	String organizacionId = request.getParameter("organizacionId");
	String fechaInicial = request.getParameter("fechaInicial");
	String fechaFinal= request.getParameter("fechaFinal");





	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department

			boolean res=appDBAuth.addAtleta_has_organizacion( Atleta_atletaId1, organizacionId,  fechaInicial, fechaFinal );%>




			<%//Verify if the user has been authenticated
			if (res){%>
		
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
	String nombreAtleta= request.getParameter("nombreAtleta");
	String segundonombre = request.getParameter("segundonombre");
	String apellidos= request.getParameter("apellidos");
	String birthday = request.getParameter("birthday");
	String genero= request.getParameter("genero");
	String email = request.getParameter("email");
	String cell= request.getParameter("cell");
	String postal = request.getParameter("postal");
	String pasaporte= request.getParameter("pasaporte");
	String vencimiento = request.getParameter("vencimiento");
	String encargado= request.getParameter("encargado");
	String compromiso = request.getParameter("compromiso");
	String conducta = request.getParameter("conducta");


	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department

			boolean res=appDBAuth.addAtleta(nombreAtleta,segundonombre,apellidos,birthday,genero,email,cell,postal,pasaporte,vencimiento,encargado,compromiso,conducta);%>





			<%//Verify if the user has been authenticated
			if (res){%>
				<script>alert("No se Pudo agregar un Atleta");
				window.location = "Menu.jsp";
				</script>
			<%}else{

				%>
				<script>alert("El Atleta se agrego exitosamente");
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
