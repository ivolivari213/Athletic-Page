

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar los resultados de los query
<%ResultSet resultset =null;%>
<%ResultSet resultset1 =null;%>




<html>
	<head>
		<title>Competencia</title>
	</head>
	<body>
		<form id="form_1" action="addCompetencia2.jsp" method="get">
		<%
    //Try to connect the database using the applicationDBManager class
			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listCompetenciat method.
			 resultset=appDBAuth.listCompetencia();

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

			//Call the listEvento1 method.
			 resultset1=appDBAuth.listEvento1();

			%>
			<%

			        }
			        catch(Exception e)
			        {
			             out.println("wrong entry"+e);
			        }
			%>

        <tr>
					<td> Competencia: </td>
					<td> <select  required class="intro" id= "select" name="ncompetencia">
						 <option value="" >Select a option</option>
             //dropdown de las competencias
						 <%while(resultset.next()){ %>

								<option value="<%=resultset.getString(1)%>"> <%= resultset.getString(1)%> <%=resultset.getString(2)%>


								</option>


						<% } %>

						</select>

						</td>
				</tr>

				<tr>
					<td> Evento: </td>
					<td> <select  required class="intro" id= "select" name="nevento">
						 <option value="">Select a option</option>
						 //dropdown de los eventos
						 <%while(resultset1.next()){ %>

								<option value="<%=resultset1.getString(1)%>"> <%= resultset1.getString(1)%> <%=resultset1.getString(2)%> ,<%=resultset1.getString(3)%>



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
