
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

			String liga = request.getParameter("liga");
			//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listLigaClub method.
			 resultset=appDBAuth.listLigaClub(liga);

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
<th>Pueblo</th>
<th>Registro departamento de estado</th>
<th>Telefono de la organizacion</th>
<th>Direccion fisica</th>
<th>Direccion postal</th>
<th> Correo electronico</th>
<th>Pagina Web</th>
<th> Reglamento</th>
</tr>
//tabla de los clubes por liga
					<%while(resultset.next()){ %>
				<tr>
							<td><%= resultset.getString(1)%></td>
							<td><%= resultset.getString(2)%></td>
							<td><%= resultset.getString(3)%></td>
							<td><%= resultset.getString(4)%></td>
							<td><%= resultset.getString(5)%></td>
							<td><%= resultset.getString(6)%></td>
							<td><%= resultset.getString(7)%></td>
							<td><a href="<%= resultset.getString(8)%>" >Pagina Web </a></td>
						  <td><a href="<%= resultset.getString(9)%>" >Reglamento </a></td>


						<% } %>
			</tr>





	</table>
		</form>
	</body>
</html>
