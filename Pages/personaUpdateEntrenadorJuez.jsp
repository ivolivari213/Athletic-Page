<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar resultados de los query

<%ResultSet resultset1 =null;%>
<%ResultSet resultset2 =null;%>
<%ResultSet resultset3 =null;%>

<html>
	<head>
		<title>Persona</title>
	</head>
	<body>
		<form id="form_1" action="addPersonaUpdateEntrenadorJuez.jsp" method="post">
			<%
			//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listActualEntrenadorAndJuez method.
			 resultset1=appDBAuth.listActualEntrenadorAndJuez();

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

			//Call the listtipolicencia method
			 resultset3=appDBAuth.listtipolicencia();

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

			//Call the listNivellicencia method.
			 resultset2=appDBAuth.listNivellicencia();

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
				<td> Entrenador/Juez y organizacion a la que pertence: </td>
						 <td> <select required name="personaId">
										<option value="">Select an option</option>
										//dropdown de entrenadores y jueces
							 <%while(resultset1.next()){ %>

									<option   value="<%=resultset1.getString(1)%>"><%=resultset1.getString(1)%> <%=resultset1.getString(2)%> , <%=resultset1.getString(3)%> <%=resultset1.getString(4)%>, <%=resultset1.getString(5)%>

									</option>


							<% } %>

							</select>

							</td>
				</tr>

					</tr>
					<tr>
					<td> Tipo de licencia: </td>
								 <td> <select required name="tipo">
										<option value="">Select an option</option>
										// dropdown de tipos de licencia
									 <%while(resultset3.next()){ %>

											<option   value="<%=resultset3.getString(1)%>"><%=resultset3.getString(1)%> <%=resultset3.getString(2)%>


											</option>


									<% } %>

									</select>

									</td>
						</tr>
						<td> Nivel de licencia: </td>
									 <td> <select required name="nivel">
											<option value="">Select an option</option>
											//dropdown de los niveles de licencia
										 <%while(resultset2.next()){ %>

												<option   value="<%=resultset2.getString(1)%>"><%=resultset2.getString(1)%> <%=resultset2.getString(3)%>


												</option>


										<% } %>

										</select>

										</td>
							</tr>
					<tr>
						<td> Fecha inicio: </td>
						<td><input type="date" id="ninicio"  name="ninicio" required /></td>
					</tr>
					<tr>
						<td> Fecha final: </td>
						<td><input type="date" id="nfinal"  name="nfinal" required /></td>
					</tr>
			</table>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
