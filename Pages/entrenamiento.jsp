


<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset1 =null;%>
<%ResultSet resultset =null;%>
<html>
	<head>
		<title>Entrenamiento</title>
	</head>
	<body>
		<form id="form_1" action="addEntrenamiento.jsp" method="post">
			<%
			//Try to connect the database using the applicationDBManager class

			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAtleta method.
			 resultset1=appDBAuth.listAtleta();

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

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department
			 resultset=appDBAuth.listPueblo();

			%>
			<%

							}
							catch(Exception e)
							{
									 out.println("wrong entry"+e);
							}
			%>

      //campos para llenar con la informacion que pide

			<table border="0">
			<tr>
			<td> Pueblo: </td>
						 <td> <select required name="idPueblo">
									<option value="">Select an option</option>
									//dropdown de los pueblos
							 <%while(resultset.next()){ %>

									<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%>


									</option>


							<% } %>

							</select>

							</td>
				</tr>
					<tr>
					<td> Atleta: </td>
								 <td> <select required name="Atleta_atletaId">
										<option value="">Select an option</option>
										//dropdown de los atletas
									 <%while(resultset1.next()){ %>

											<option   value="<%=resultset1.getString(1)%>"><%=resultset1.getString(1)%> <%=resultset1.getString(2)%> , <%=resultset1.getString(3)%>


											</option>


									<% } %>

									</select>

									</td>
						</tr>
				<tr>
					<td> Lugar: </td>
					<td><input type="text" id="lugar"  name="lugar" required /></td>
				</tr>
				<tr>
					<td> Fecha: </td>
					<td><input type="datetime-local" id="fecha"  name="fecha" required />
				</tr>
			</table>
			<td> Comentarios: </td>
			<div>
			<textarea name="comentarios" rows="5" cols="50"></textarea>
		  </div>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
