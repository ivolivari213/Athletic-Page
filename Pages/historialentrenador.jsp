
<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar el resultado de los query
<%ResultSet resultset =null;%>
<html>
	<head>
		<title>List</title>
	</head>
	<body>
		<form id="form_1" action="historialentrenador2.jsp" method="post">
			<%
			//Try to connect the database using the applicationDBManager class

						try{
				applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
				System.out.println("Connecting...");
				System.out.println(appDBAuth.toString());

				//Call the historialentrenador method.

				 resultset=appDBAuth.historialentrenador();
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

  	<td> Seleccione un entrenador: </td>

  				 <td> <select  name="entrenador">
//dropdown de los entrenadores
  					 <%while(resultset.next()){ %>

  							<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%> <%=resultset.getString(3)%>

  							</option>

  					<% } %>

  					</select>


  					</td>

  	</table>
  	<input type="submit" id="Submit" value="submit" />
  	<input type="reset" id="Submit" value="reset" />
  		</form>
  	</body>
  </html>
