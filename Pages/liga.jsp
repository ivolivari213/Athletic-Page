


<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar los resultados de los query
<%ResultSet resultset =null;%>


<html>
	<head>
		<title>Liga</title>
	</head>
	<body>
		<form id="form_1" action="addLiga.jsp" method="post">
			<%
			//Try to connect the database using the applicationDBManager class

			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listPueblo method.
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
					<td> Nombre de la liga: </td>
					<td><input type="text" id="organizacion"  name="organizacionNombre" required /></td>
				</tr>



				<tr>
					<td> Registro departamento de estado: </td>
					<td><input type="text" id="registro"  name="organizacionRegistroDptoEstado" required />
				</tr>
        <tr>
      <td> Telefono: </td>
      <td><input type="tel" id="cell"  name= "organizacionTelefono" required /></td>
    </tr>
    <tr>
      <td> Direccion fisica: </td>
      <td><textarea name="organizacionDireccionFisica" rows="5" cols="50" required ></textarea></td>
    </tr>
		<tr>
		<td> Pueblo: </td>

					 <td> <select required name="Pueblo_idPueblo" >
						<option value="" >Select a option</option>
						//dropdown de los pueblos
						 <%while(resultset.next()){ %>

								<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%>


								</option>



						<% } %>

						</select>


						</td>
			</tr>
			<tr>
        <td> Correo electronico: </td>
        <td><input type="text" id="email"  name="organizacionCorreoElectronico" required />
      </tr>
      <tr>
          <td> Pagina Web:: </td>
          <td><input type="url" id="pagina"  name="organizacionPaginaWeb" required />
        </tr>
        <tr>
				<td> Direccion postal: </td>
				<td><textarea name="organizacionDireccionPostal" rows="5" cols="50" required ></textarea></td>
			</tr>
      <tr>
        <td> Reglamento URL: </td>
      <td><input type="url" id="reglamento"  name="organizacionReglamentoUrl" required />
      </tr>
			</table>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
			<input type="button" value=" back" >
		</form>
	</body>
</html>
