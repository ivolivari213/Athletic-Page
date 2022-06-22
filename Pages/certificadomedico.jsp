

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>

<%ResultSet resultset =null;%>
<html>
	<head>
		<title>Certificado Medico</title>
	</head>
	<body>
		<form id="form_1" action="addCertificadomedico.jsp" method="get">
			<%
			//Try to connect the database using the applicationDBManager class

			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listatleta method
			 resultset=appDBAuth.listAtleta();

			%>
			<%
			//**Should I input the codes here?**
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

							 <%while(resultset.next()){ %>

									<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%> , <%=resultset.getString(3)%>


									</option>


							<% } %>

							</select>

							</td>
				</tr>
				<tr>
					<td> Certificado medico: </td>
				<td><input type="url" name="archivo" required></td>
			</tr>
				<tr>
					<td> Fecha en que se sometio el documento: </td>
					<td><input type="date" id="fecha"  name="fecha" required />
				</tr>
			</table>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
