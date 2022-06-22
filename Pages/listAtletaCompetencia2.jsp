
<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variable para guardar los resultados de los query
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
		String atleta = request.getParameter("atleta");
		//Try to connect the database using the applicationDBManager class

						try{
				applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
				System.out.println("Connecting...");
				System.out.println(appDBAuth.toString());

				//Call the ListAtletaByCompetencia method.

				 resultset=appDBAuth.ListAtletaByCompetencia(atleta);
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
	<th>Apellidos</th>
	<th>Competencia</th>
  <th>Resultado</th>
  <th>Posicion</th>
  <th>Fecha de la competencia</th>
  <th>Lugar de la competencia</th>
  <th>Nombre de la organizacion que realizo la competencia</th>
</tr>
//tabla de atletas por competencia
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




						<% } %>
			</tr>




	</table>
		</form>
	</body>
</html>
