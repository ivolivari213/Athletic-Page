
<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<html>
	<head>
		<style>
table, th, td {
  border: 1px solid black;
}
</style>
		<title>List</title>
	</head>
	<body>
		<form id="form_1" method="post">
			<%

			//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department
			 resultset=appDBAuth.listAtletaByClub();

			%>
			<%
			//**Should I input the codes here?**
							}
							catch(Exception e)
							{
									 out.println("wrong entry"+e);
							}
			%>

	<table border="0" id="ex-table">
	 <tr>
		<th>Nombre</th>
	<th>Apellido</th>
		<th>Club</th>

	</tr>
	//tabla de atletas por club
						<%while(resultset.next()){ %>
				<tr>
							<td><%= resultset.getString(1)%></td>
							<td><%= resultset.getString(2)%></td>
							<td><%= resultset.getString(3)%></td>

						<% } %>
			</tr>

	</table>
		</form>
	</body>
</html>
