

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
	String userName = request.getParameter("userName");
	String userPass = request.getParameter("userPass");
	String completeName = request.getParameter("completeName");
	
	
	
	
	
	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());
			
			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department
			boolean res=appDBAuth.addUser(userName, completeName, userPass);%>
		
			
			
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
		sessionName=<%=session.getAttribute("userName")%>
		
		<%
	//Retrieve variables
	String userName1 = request.getParameter("userName");
	String date = request.getParameter("date");
	String redirect = "welcome.html";
	
	
	
	
	//Try to connect the database using the applicationDBManager class
	try{
			//Create the appDBMnger object
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());
			
			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department
			boolean res=appDBAuth.addRole(userName1, date);%>
		
			
			
			<%//Verify if the user has been authenticated
			
			if (res){%>
					
				<script>alert("No se Pudo agregar Usuario");
				window.location = "welcome.html";
				
				</script>
				
			<%}else{
				  
				%>
				
				<script>alert("Su cuenta ha sido creada exitosamente");
				window.location = "welcome.html";
				
				
				
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
