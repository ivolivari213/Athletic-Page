
<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar resultados de los query
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

			//Call the listAllJuecesByLiga method.
			 resultset=appDBAuth.listAllJuecesByLiga();

			%>
			<%

							}
							catch(Exception e)
							{
									 out.println("wrong entry"+e);
							}
			%>

	<table border="0" id="ex-table">
<tr>
	<th>Organizacion</th>
	<th>Nombre</th>
	<th>Apellidos</th>
	<th>Posicion</th>
	<th>Licencia</th>
	<th>Nivel de licencia</th>
	<th>Licencia Vigente Hasta</th>
</tr>
//tabla de jueces y su info
						<%while(resultset.next()){ %>
				<tr>
							<td><%= resultset.getString(1)%></td>
							<td><%= resultset.getString(2)%></td>
							<td><%= resultset.getString(3)%></td>
							<td><%= resultset.getString(4)%></td>
							<td><%= resultset.getString(5)%></td>
							<td><%= resultset.getString(6)%></td>
							<td><%= resultset.getString(7)%></td>



						<% } %>
			</tr>




	</table>
		</form>
	</body>
</html>
