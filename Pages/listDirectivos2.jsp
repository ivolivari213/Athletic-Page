
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

			//Call the listByDirectivos method.
			 resultset=appDBAuth.listByDirectivos(liga);

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
	<th>Posicion</th>
</tr>
//tabla directivos
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
