<%@ page import="java.lang.*"%>
<%@ page import="ut.JAR.proyecto2.*"%>
<%@ page import="java.sql.*" %>
//variables para guardar resultados de los query

<%ResultSet resultset =null;%>
<%ResultSet resultset1 =null;%>
<%ResultSet resultset2 =null;%>
<%ResultSet resultset3 =null;%>
<%ResultSet resultset4 =null;%>
<html>
	<head>
		<title>Persona</title>
	</head>
	<body>
		<form id="form_1" action="addPersona1.jsp" method="post">
			<%
			//Try to connect the database using the applicationDBManager class

					try{
			applicationDBAuthenticationGoodComplete appDBAuth = new applicationDBAuthenticationGoodComplete();
			System.out.println("Connecting...");
			System.out.println(appDBAuth.toString());

			//Call the listOrganizacion method.
			 resultset1=appDBAuth.listOrganizacion();

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

			//Call the listtipolicencia method.
			 resultset3=appDBAuth.listtipolicencia();

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

			//Call the listNivellicencia method
			 resultset2=appDBAuth.listNivellicencia();

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

			//Call the listOcupacion1 method.

			 resultset=appDBAuth.listOcupacion1();
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

			//Call the displayMax2 method.
			 resultset4=appDBAuth.displayMax2();

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

			<%if(resultset4.next()){ %>
			<%if(resultset4.getString(1)==null){%>
			  <input type="hidden" name="personaId" value="1" readonly><br>
			<%}%>
			<%if(resultset4.getString(1)!=null){%>
			 <input type="hidden" name="personaId" value="<%=resultset4.getString(1)%>" readonly><br>
			<%}%>
			<% } %>
				<tr>
					<td> Nombre: </td>
					<td><input type="text" id="nombre"  name="nombre" required /></td>
				</tr>
				<tr>
					<td> Apellidos: </td>
					<td><input type="text" id="apellidos"  name="apellidos" required />
				</tr>
        <tr>
					<td> Fecha de nacimiento: </td>
					<td><input type="date" id="birthday"  name="birthday" max="2001-01-01" required /></td>
				</tr>
						<tr>
							<td> Correo electronico: </td>
							<td><input type="text"  id="email"  name="email" required />
						</tr>
						<tr>
							<td> Direccion fisica: </td>
							<td><textarea name="fisica" rows="5" cols="50"></textarea></td>
						</tr>
						<tr>
						<td> Direccion postal: </td>
						<td><textarea name="postal" rows="5" cols="50"></textarea></td>
					</tr>
				<tr>
					<td> Numero de pasaporte: </td>
					<td><input type="text" id="pasaporte"  name="pasaporte" required /></td>
				</tr>
					<tr>
						<td> Vencimiento del pasaporte: </td>
						<td><input type="date" id="vencimiento"  name="vencimiento" required /></td>
					</tr>
					<tr>
					<td> Organizaciones a la que pertence: </td>
								 <td> <select required name="organizaciones"  >
										<option value="">Select an option</option>
										// dropdown de las organizaciones
									 <%while(resultset1.next()){ %>

											<option   value="<%=resultset1.getString(1)%>"><%=resultset1.getString(1)%> <%=resultset1.getString(2)%>


											</option>


									<% } %>

									</select>

									</td>
						</tr>
						<tr>
						<td> Posicion que ocupa: </td>
									 <td> <select required name="posicion">
											<option value="">Select an option</option>
											// dropdown de las posiciones
										 <%while(resultset.next()){ %>

												<option   value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%> <%=resultset.getString(2)%>


												</option>


										<% } %>

										</select>

										</td>
							</tr>
					<tr>
						<td> Fecha de inicio: </td>
						<td><input type="date" id="inicio"  name="inicio" required /></td>
					</tr>
					<tr>
						<td> Fecha final: </td>
						<td><input type="date" id="fin"  name="fin" required /></td>
					</tr>
					<tr>
					<td> Tipo de licencia: </td>
								 <td> <select required name="tipo">
										<option value="">Select an option</option>
										//dropdown de los tipos de licencia
									 <%while(resultset3.next()){ %>

											<option   value="<%=resultset3.getString(1)%>"><%=resultset3.getString(1)%> <%=resultset3.getString(2)%>


											</option>


									<% } %>

									</select>

									</td>
						</tr>
						<td> Nivel de licencia: </td>
									 <td> <select required name="nivel">
											<option value="">Select an option</option>
											//dropdown de los niveles de las licencias
										 <%while(resultset2.next()){ %>

												<option   value="<%=resultset2.getString(1)%>"><%=resultset2.getString(1)%> <%=resultset2.getString(3)%>


												</option>


										<% } %>

										</select>

										</td>
							</tr>
					<tr>
						<td> Fecha inicio: </td>
						<td><input type="date" id="ninicio"  name="ninicio" required /></td>
					</tr>
					<tr>
						<td> Fecha final: </td>
						<td><input type="date" id="nfinal"  name="nfinal" required /></td>
					</tr>
			</table>
			<input type="submit" id="Submit" value="submit" />
			<input type="reset" id="Submit" value="reset" />
		</form>
	</body>
</html>
