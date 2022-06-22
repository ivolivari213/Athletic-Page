
<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar resultados de los query
<%ResultSet resultset =null;%>
<html>
	<head>
		<title>List</title>
	</head>
	<body>
		<form id="form_1" action="listClub2.jsp" method="post">

			<%
			//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listLigaByClub method
			 resultset=appDBAuth.listLigaByClub();

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
					<td> Seleccione la liga donde quiere ver los clubes disponibles: </td>
								 <td> <select required name="liga"  >
										<option value="">Select an option</option>
									 <%while(resultset.next()){ %>
                      //dropdown de ligas
											<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(2)%>


											</option>


									<% } %>

									</select>

									</td>
						</tr>

	</table>
	<input type="submit" id="Submit" value="submit" />
	<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
