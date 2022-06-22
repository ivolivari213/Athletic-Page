


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
		<form id="form_1" action="addAtleta.jsp" method="post">
			<%
			//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDirectivos method.
			 resultset=appDBAuth.listAllDirectivos();

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
		<th>Nombre</th>
	<th>Apellido</th>
		<th>Posicion</th>
	<th> Organizacion</th>
	<th> Pueblo</th>
	<th>Registro departamento de estado</th>
<th>Telefono de la organizacion</th>
	<th>Direccion fisica</th>
<th>Direccion postal</th>
<th> Correo electronico</th>
<th>Pagina Web</th>
<th> Reglamento</th>
	</tr>
	//tabla con ligas de los directivos
					<%while(resultset.next()){ %>
				<tr>
							<td><%= resultset.getString(1)%></td>
							<td><%= resultset.getString(2)%></td>
							<td><%= resultset.getString(3)%></td>
							<td><%= resultset.getString(4)%></td>
							<td><%= resultset.getString(5)%></td>
							<td><%= resultset.getString(6)%></td>
							<td><%= resultset.getString(7)%></td>
							<td><%= resultset.getString(8)%></td>
							<td><%= resultset.getString(9)%></td>
							<td><%= resultset.getString(10)%></td>
							 <td><a href="<%= resultset.getString(11)%>" >Pagina Web </a></td>
						  <td><a href="<%= resultset.getString(12)%>" >Reglamento </a></td>
						<% } %>
			</tr>

	</table>
		</form>
	</body>
</html>
