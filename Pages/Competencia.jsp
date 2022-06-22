

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar los resultados de los query
<%ResultSet resultset =null;%>


<html>
	<head>
		<title>Competencia</title>
	</head>
	<body>
		<form id="form_1" action="addCompetencia.jsp" method="get">
		<%
		//Try to connect the database using the applicationDBManager class

			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listOrganizacion method.
			 resultset=appDBAuth.listOrganizacion();

			%>
			<%

			        }
			        catch(Exception e)
			        {
			             out.println("wrong entry"+e);
			        }
			%>
			<table border="0">
				<tr>
					<td> Nombre de la competencia: </td>
					<td><input type="text" id="ncompetencia"  name="ncompetencia" /></td>
				</tr>
				<tr>
					<td> Fecha: </td>
					<td><input type="datetime-local" id="fecha"  name="fecha" />
				</tr>
        <tr>
					<td> Lugar: </td>
					<td><input type="text" id="lugar"  name="lugar" /></td>
				</tr>
        <tr>
					<td> Organizacion: </td>
					<td> <select  class="intro" id= "select" name="organizacion_lorganizacionLiga" >
						 <option>Select a option</option>
						 //dropdown de las organizaciones

						 <%while(resultset.next()){ %>

								<option value="<%=resultset.getString(1)%>"> <%= resultset.getString(1)%> <%=resultset.getString(2)%>


								</option>


						<% } %>

						</select>

						</td>
				</tr>

			</table>
			<input type="submit" id="Submit" value="submit" />
			<% request.setAttribute("ncompetencia", "Competencia.jsp");%>

			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
