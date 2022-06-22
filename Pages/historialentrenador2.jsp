
<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables con los resultados de los query
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

	  String personaId = request.getParameter("entrenador");
		//conneccion a la base de datos
						try{
				applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
				System.out.println("Connecting...");
				System.out.println(appDBAuth.toString());

				//Call the historialentrenador1 method.

				 resultset=appDBAuth.historialentrenador1(personaId);
				%>
				<%

								}
								catch(Exception e)
								{
										 out.println("wrong entry"+e);
								}
				%>
        //campos para llenar con la informacion que pide

	<table border="0" id="ex-table">
<tr>
	<th>Nombre</th>
	<th>Apellidos</th>
	<th>Posicion</th>
  <th>Licencia</th>
	<th>Nivel de licencia</th>
	<th>Nombre de la organizacion a la que pertenece o pertenecio</th>
  <th>Vigente hasta</th>
</tr>
//tabla con resultados
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
