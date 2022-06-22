

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>

<%ResultSet resultset =null;%>
<%ResultSet resultset1 =null;%>

<html>
	<head>
		<title>Resultados</title>
	</head>
	<body>
		<form id="form_1" action="addAtletaCompetencia.jsp" method="post">
			<%
			//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//resultado del query de los atletas guardado en la variable resultset1

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

			//resultado del query para los eventos

			 resultset=appDBAuth.listEvento2();
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
				<td> Evento: </td>
							 <td> <select required name="competenciaEventos_competenciaEventosId">
									<option value="">Select an option</option>
									//dropdown de los eventos
								 <%while(resultset.next()){ %>

										<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%> , <%=resultset.getString(3)%>


										</option>


								<% } %>

								</select>

								</td>
					</tr>
        <tr>
					<td> Resultado: </td>
					<td><input type="number" id="resultado" name="resultado" step="any" min="0" required ><td>
				</tr>
				<tr>
					<td> Posicion: </td>
					<td><input type="number" id="posicion"  name="posicion" min="0" required /></td>
				</tr>
			</table>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
