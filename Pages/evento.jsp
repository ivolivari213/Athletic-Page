

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar el resultado de los query
<%ResultSet resultset =null;%>

<html>
	<head>
		<title>Evento</title>
	</head>
	<body>
		<form id="form_1" action="addEvento.jsp" method="get">


			<%
			//Try to connect the database using the applicationDBManager class

			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department
			 resultset=appDBAuth.listCategoria();

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
				<td> Seleccione la categoria: </td>
			<td>	<select name="categoria" required >
                    <option value="" >Select a option</option>
										//dropdown de las categorias
						 <%while(resultset.next()){ %>

								<option value="<%=resultset.getString(1)%>"> <%= resultset.getString(1)%> <%=resultset.getString(2)%>


								</option>


						<% } %>
</select>
</td>
</tr>
<tr>
 <td> Nombre del evento: </td>
 <td><input type="text" id="evento"  name="evento" required /></td>
</tr>
<tr>
<td> Descripcion del evento: </td>
<td><input type="text" id="descripcion"  name="descripcion" required /></td>
</tr>
</table>
<input type="submit" id="Submit" value="submit" />
<input type="reset" id="Submit" value="reset" />
</form>
</body>
</html>
