

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//resultado de los query
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

				//Call the ListAtletaByEntrenador method

				 resultset=appDBAuth.ListAtletaByEntrenador(atleta);
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
	<th>Nombre del atleta</th>
	<th>Apellidos del Atleta</th>
	<th>Nombre del entrenador</th>
  <th>Apellidos del Entrenador</th>
  <th>Posicion</th>
  <th>Fecha incial del entrenador </th>
  <th>Fecha final del entrenador</th>

</tr>
//tabla de los atletas por entrenador
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
