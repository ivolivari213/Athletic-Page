

<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>

<%ResultSet resultset =null;%>
<%ResultSet resultset1 =null;%>
<%ResultSet resultset2 =null;%>

<html>
	<head>
		<title>Atleta</title>
	</head>
	<body>
		<form id="form_1" action="addAtleta.jsp" method="get">

		<%
		//Try to connect the database using the applicationDBManager class
			    try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listPueblo method. This method returns a ResultSet containing all the tuples in the table pueblo

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

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department
			 resultset1=appDBAuth.displayMax1();

			%>
			<%
			//**Should I input the codes here?**
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

			//Call the listAllDepartment method. This method returns a ResultSet containing all the tuples in the table Department
			 resultset2=appDBAuth.listOrganizacion();

			%>
			<%
			        }
			        catch(Exception e)
			        {
			             out.println("wrong entry"+e);
			        }
			%>
			<table border="0">

//muestra en forma de dropdown los resultados de resultset1
			<%if(resultset1.next()){ %>
			<%if(resultset1.getString(1)==null){%>
			  <input type="hidden" name="Atleta_atletaId" value="1" readonly><br>
			<%}%>
			<%if(resultset1.getString(1)!=null){%>
			 <input type="hidden" name="Atleta_atletaId" value="<%=resultset1.getString(1)%>" readonly><br>
			<%}%>
			<% } %>

// muestra todos los campos de texto y informacion que pide para llenar
			<tr>
					<td> Nombre del Atleta : </td>
					<td><input type="text" id="nombreAtleta"  name="nombreAtleta" required /></td>
				</tr>
				<tr>
					<td> Segundo nombre: </td>
					<td><input type="text" id="segundonombre"  name="segundonombre" />
				</tr>
				<tr>
					<td> Apellidos: </td>
					<td><input type="text" id="apellidos"  name="apellidos" required />
				</tr>
        <tr>
					<td> Fecha de nacimiento: </td>
					<td><input type="date" size="12" maxlength="10" id="birthday"  name="birthday"max="2016-01-01" required /></td>
				</tr>
					<tr>
						<td> Genero: </td>
						<td><input type="radio" name="genero" value="h" required> Hombre
  					<input type="radio" name="genero" value="m" required> Mujer	</td>
					</tr>
					<tr>
							<td> Correo electronico: </td>
							<td><input type="text" id="email"  name="email" />
						</tr>
						<tr>
					<td> Telefono: </td>
					<td><input type="tel" placeholder="xxx-xxx-xxxx" size="12" maxlength="12" id="cell"  name="cell" required /></td>
				</tr>
				<tr>
					<td> Direccion fisica: </td>
					<td><textarea name="fisica" rows="5" cols="50" required ></textarea></td>
				</tr>
				<tr>
				<td> Direccion postal: </td>
				<td><textarea name="postal" rows="5" cols="50" required ></textarea></td>
			</tr>

			<tr>
		<td> Pueblo: </td>

					 <td> <select  required name="Pueblo_idPueblo">
						<option value="" >Select an option</option>
						//dropdown de los pueblos
						 <%while(resultset.next()){ %>

								<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%>


								</option>



						<% } %>

						</select>


						</td>
			</tr>


			<tr>
					<td> Numero de pasaporte: </td>
					<td><input type="text" id="pasaporte"  name="pasaporte" /></td>
				</tr>
					<tr>
						<td> Vencimiento del pasaporte: </td>
						<td><input type="date" size="12" maxlength="10" id="vencimiento"  name="vencimiento" /></td>
					</tr>
					<td> Nombre del encargado(a)(llenar solo si es menor de 18): </td>
					<td><input type="text" id="encargado"  name="encargado" /></td>
				</tr>
				<td> Organizacion a la que pertenece: </td>

					 <td> <select required  name="organizacionId">
						<option value="" >Select an option</option>
						//dropdown de las organizaciones
						 <%while(resultset2.next()){ %>

								<option   value="<%=resultset2.getString(1)%>"><%=resultset2.getString(1)%> <%=resultset2.getString(2)%>


								</option>



						<% } %>

						</select>


						</td>
			</tr>

			 <tr>
					<td> Desde: </td>
					<td><input type="date" size="12" maxlength="10" id="fechaInicial"  name="fechaInicial"  /></td>
				</tr>

				 <tr>
					<td> Hasta: </td>
					<td><input type="date" size="12" maxlength="10" id="fechaFinal"  name="fechaFinal" max="2031-12-30"/></td>
				</tr>

				<tr>
					<td> Compromiso etico: </td>
					<td><input type="url" id="compromiso"  name="compromiso" required /></td>
				</tr>

					<tr>
					<td> Politica de conducta,: </td>
					<td><input type="url" id="conducta"  name="conducta"  required /></td>
				</tr>

				<tr>
					<td> Fecha de Efectividad,: </td>
					<td><input type="date" size="12" maxlength="10" id="fecha"  name="fecha" required /></td>
				</tr>
			</table>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
