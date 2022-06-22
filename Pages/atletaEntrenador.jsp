

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>

<%ResultSet resultset =null;%>
<%ResultSet resultset1 =null;%>
<html>
	<head>
		<title>atletaEntrenador</title>
	</head>
	<body>
		<form id="form_1" action="addAtletaEntrenador.jsp" method="post">
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

			<%		//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listEntrenador method
			 resultset=appDBAuth.listEntrenador();

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
			<td> Entrenador: </td>
						 <td> <select required name="personaId">
								<option value="">Select an option</option>
								//dropdown de los entrenadores
							 <%while(resultset.next()){ %>

									<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%> <%=resultset.getString(3)%>


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
					<td> Fecha de inicial del compromiso: </td>
					<td><input type="date"size="12" maxlength="10" id="inicial"  name="inicial" required />
				</tr>
        <tr>
					<td> Fecha final del compromiso: </td>
					<td><input type="date" size="12" maxlength="10" id="final"  name="final" required /></td>
				</tr>
			</table>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
