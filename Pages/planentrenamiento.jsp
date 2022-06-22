<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar resultados de los query

<%ResultSet resultset =null;%>
<%ResultSet resultset1 =null;%>

<html>
	<head>
		<title>plan de entrenamiento</title>
	</head>
	<body>
		<form id="form_1" action="addPlanentrenamiento.jsp" method="get">
			<%
			//Try to connect the database using the applicationDBManager class

			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAtleta method.
			 resultset=appDBAuth.listAtleta();

			%>
			<%

			        }
			        catch(Exception e)
			        {
			             out.println("wrong entry"+e);
			        }
			%>


			<%
			//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listEntrenador method
			 resultset1=appDBAuth.listEntrenador();

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
			<td> Entrenador: </td>
						 <td> <select required name="entrenadorId">
								<option value="">Select an option</option>
                //dropdown de los entrenadores
							 <%while(resultset1.next()){ %>

									<option   value="<%=resultset1.getString(1)%>"><%=resultset1.getString(1)%> <%=resultset1.getString(2)%> <%=resultset1.getString(3)%>


									</option>


							<% } %>

							</select>

							</td>
				</tr>
			<tr>
			<tr>
			<td> Atleta: </td>
						 <td> <select required name="Atleta_atletaId">
								<option value="">Select an option</option>
								//dropdown de los atletas
							 <%while(resultset.next()){ %>

									<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%> , <%=resultset.getString(3)%>


									</option>


							<% } %>

							</select>

							</td>
				</tr>
        <tr>
					<td> Fecha de Inicio: </td>
					<td><input type="date" id="fecha"  name="fecha" required />
				</tr>
				<tr>
					<td> Plan de entrenamiento: </td>
				<td><input type="url" name="archivo" required ></td>
			</tr>

			</table>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
