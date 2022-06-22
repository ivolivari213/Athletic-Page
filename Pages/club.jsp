

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>

<%ResultSet resultset =null;%>
<%ResultSet resultset1 =null;%>
<%ResultSet resultset2 =null;%>


<html>

	<head>
	<style>
.intro {
  position: absolute;
  left: 230px;
  top: 10px;
}
</style>
		<title>Liga</title>

	</head>
	<body>

		<form id="form_1" name="f1" action="addClub.jsp" method="post">


			<%
			//Try to connect the database using the applicationDBManager class

			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listLiga method.
			 resultset1=appDBAuth.listLiga();

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

			//Call the listPueblo method

			 resultset=appDBAuth.listPueblo();
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

			//Call the displayMax method.
			 resultset2=appDBAuth.displayMax();

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
		<td> Escoja la Liga: </td>
					 <td> <select  required class="intro" id= "select" name="organizacion_lorganizacionLiga" onclick="myFunction()" >
						 <option value="" >Select a option</option>
						 //dropdown de las ligas
						 <%while(resultset1.next()){ %>

								<option value="<%=resultset1.getString(1)%>"> <%= resultset1.getString(1)%> <%=resultset1.getString(2)%>


								</option>


						<% } %>

						</select>

						</td>
			</tr>




			<td> Id del Club: </td>
			<%if(resultset2.next()){ %>
			<td>  <input type="text" name="organizacion_lorganizacionClub" value="<%=resultset2.getString(1)%>" readonly><br>
			<% } %>
			</td>

				<tr>
					<td> Nombre del club: </td>
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
					 <td> <select required name="Pueblo_idPueblo">
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
          <td> Pagina Web: </td>
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

	    <td> Fecha de Inicio:  </td>
      <td><input type="date" name="clubLigaFechaInicio" min="2019-11-30" max="2019-12-30" required   />
      </tr>

	    <td> Fecha en la que termina: </td>
      <td><input type="date" name="clubLigaFechaFin" min="2020-11-30" max="2020-11-30" required />
      </tr>
			</table>

			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
			  <input type="button" value=" back" >
</div>
  </tbody>
		</form>



	</body>

</html>
