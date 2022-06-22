/* By: Ivan Olivari, Bryan Ramos*
 *Mobile web and programming    *
 *cpen 410											*
*/

//This class belongs to the ut.JAR.proyecto2 package
package ut.JAR.proyecto2;

//Import the java.sql package for managing the ResulSet objects
import java.sql.* ;

//Import hashing functions
import org.apache.commons.codec.*;


public class applicationDBAuthenticationGoodComplete{

	//myDBConn is an MySQLConnector object for accessing to the database
	private MySQLCompleteConnector myDBConn;

	/********
		Default constructor
		It creates a new MySQLConnector object and open a connection to the database
		@parameters:

	*/
	public applicationDBAuthenticationGoodComplete(){
		//Create the MySQLConnector object
		myDBConn = new MySQLCompleteConnector();

		//Open the connection to the database
		myDBConn.doConnection();
	}


	/*******
		authenticate method
			Authentication method
			@parameters:
			@returns:
				A ResultSet containing the userName and all roles assigned to her.
	*/
	public ResultSet authenticate(String userName, String userPass)
	{

		//Declare function variables
		String fields, tables, whereClause, hashingVal;

		//Define the table where the selection is performed
		tables="usergood, roleusergood";
		//Define the list fields list to retrieve assigned roles to the user
		fields ="usergood.UserName , roleusergood.roleId, usergood.Name";
		hashingVal = hashingSha256(userName + userPass);
		whereClause="usergood.userName = roleusergood.userName and usergood.userName='" +userName +"' and hashing='" + hashingVal + "'";


		System.out.println("listing...");

		//Return the ResultSet containing all roles assigned to the user
		return myDBConn.doSelect(fields, tables, whereClause);
	}


	/*******
		menuElements method
			Authentication method
			@parameters:
			@returns:
				A ResultSet containing the userName and all roles assigned to her.
	*/
	public ResultSet menuElements(String userName)
	{

		//Declare function variables
		String fields, tables, whereClause, orderBy;

		//Define the table where the selection is performed
		tables="roleusergood, role, rolewebpagegood, menuElement,webpagegood ";
		//Define the list fields list to retrieve assigned roles to the user
		fields ="rolewebpagegood.pageURL, menuElement.title, webpagegood.pageTitle";
		whereClause=" roleusergood.roleID=role.roleID and role.roleID=rolewebpagegood.roleId and menuElement.menuID = webpagegood.menuID";
		whereClause+=" and rolewebpagegood.pageURL=webpagegood.pageURL";
		whereClause+=" and userName='"+ userName+"' order by menuElement.title, webpagegood.pageTitle;";


		System.out.println("listing...");

		//Return the ResultSet containing all roles assigned to the user
		return myDBConn.doSelect(fields, tables, whereClause);
	}

	public ResultSet verifyUser(String userName, String currentPage, String previousPage)
	{

		//Declare function variables
		String fields, tables, whereClause, hashingVal;

		//Define the table where the selection is performed
		tables="roleusergood, role, rolewebpagegood, webpagegood, usergood, webpageprevious";
		fields ="usergood.userName, roleusergood.roleId, usergood.Name ";
		whereClause=" usergood.userName = roleusergood.userName and usergood.userName='" +userName +"' and role.roleId=roleusergood.roleId and ";
		whereClause+=" rolewebpagegood.roleId=role.roleId and rolewebpagegood.pageURL=webpagegood.pageURL and webpagegood.pageURL='" +currentPage+"' and ";
		whereClause+=" webpageprevious.previousPageURL='"+previousPage+"'";


		System.out.println("listing...");

		//Return the ResultSet containing all roles assigned to the user
		return myDBConn.doSelect(fields, tables, whereClause);


	}

	//se utiliza para añadir usuarios nuevos ya sean atletas o personas como jueces, entrenadores, etc.
	public boolean addUser(String userName, String completeName, String userPass)
	{
		boolean res;
		String table, values, hashingValue;
		hashingValue=hashingSha256(userName + userPass);
		table="usergood";
		values="'"+userName+"', '" +hashingValue+"', '"+ completeName + "'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
// add an automatic role to the new user 
public boolean addRole(String userName,  String date)
	{
		boolean res;
		String table, values;
		String roleId="rol3";
		table="roleusergood";
		values="'"+userName+"', '" +roleId+"', '"+ date + "'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/*********
		hashingSha256 method
			Generates a hash value using the sha256 algorithm.
			@parameters: Plain text
			@returns: the hash string based on the plainText
	*/
	private String hashingSha256(String plainText)
	{
			String sha256hex = org.apache.commons.codec.digest.DigestUtils.sha256Hex(plainText);
			return sha256hex;
	}

		//Define the list fields list to retrieve assigned roles to the user
	public ResultSet seleccion(String organizacionTipoNombre)
	{

		String field, table, whereClause;
		table="organizacionTipo";
		field="organizacionTipo.organizacionTipoNombre";
		//Define the list fields list to retrieve assigned roles to the user
		whereClause="organizacionTipo.organizacionTipoNombre='" +organizacionTipoNombre +"'";



		System.out.println("listing...");
		return myDBConn.doSelect(field, table, whereClause);
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla liga de la base de datos*/
	public boolean addLiga( String Pueblo_idPueblo, String organizacionNombre,String organizacionRegistroDptoEstado,String organizacionTelefono, String organizacionDireccionFisica,String organizacionCorreoElectronico,String organizacionPaginaWeb,String organizacionDireccionPostal,String organizacionReglamentoUrl)
	{
		boolean res;

		String lorganizacionD="0";
		int organizacionTipo_organizacionTiopoID =1;
		String table,values;
		table="organizacion";
		values="'"+lorganizacionD+"', '"+Pueblo_idPueblo+"', '"+organizacionTipo_organizacionTiopoID+"', '"+organizacionNombre+"', '"+organizacionRegistroDptoEstado+"', '"+organizacionTelefono+"', '"+organizacionDireccionFisica+"', '"+organizacionCorreoElectronico+"', '"+organizacionPaginaWeb+"', '"+organizacionDireccionFisica+"', '"+organizacionReglamentoUrl+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para hacer un dropdown de los pueblos que hay en la base de datos, se utiliza en las paginas que lo necesiten*/
	public ResultSet listPueblo()
	{

		String field, table;
		table="pueblo";
		field="*";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table);
	}

	/* esta funcion se utiliza para hacer un dropdown de las ligas que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listLiga()
	{

		String field, table,whereClause;
		table="organizacion";
		field="lorganizacionD,organizacionNombre";
		whereClause="organizacionTipo_organizacionTipoID=1";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla organizacion de la base de datos*/
		public boolean addClub(String Pueblo_idPueblo, String organizacionNombre,String organizacionRegistroDptoEstado,String organizacionTelefono, String organizacionDireccionFisica,String organizacionCorreoElectronico,String organizacionPaginaWeb,String organizacionDireccionPostal,String organizacionReglamentoUrl)
	{
		boolean res;

		String lorganizacionD="0";
		int organizacionTipo_organizacionTiopoID =2;
		String table,values;
		table="organizacion";
		values="'"+lorganizacionD+"', '"+Pueblo_idPueblo+"', '"+organizacionTipo_organizacionTiopoID+"', '"+organizacionNombre+"', '"+organizacionRegistroDptoEstado+"', '"+organizacionTelefono+"', '"+organizacionDireccionFisica+"', '"+organizacionCorreoElectronico+"', '"+organizacionPaginaWeb+"', '"+organizacionDireccionFisica+"', '"+organizacionReglamentoUrl+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla clubLiga de la base de datos*/
	public boolean addClub1(String organizacion_lorganizacionClub , String organizacion_lorganizacionLiga, String clubLigaFechaInicio,String clubLigaFechaFin )
	{
		boolean res;
		String table,values;
		String clubLigaId="0";
		table="clubLiga";
		values="'"+clubLigaId+"', '"+organizacion_lorganizacionLiga+"', '"+organizacion_lorganizacionClub+"', '"+clubLigaFechaInicio+"', '"+clubLigaFechaFin+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para sumarle 1 al id que no son autoincrement para igualarlo a otra tabla que utilize el mismo id*/
	public ResultSet displayMax()
	{

		String field, table;
		table="organizacion";
		field="lorganizacionD";

		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectMax(field, table);
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla organizacion de la base de datos*/
	public boolean addOrganismo( String Pueblo_idPueblo, String organizacionNombre,String organizacionRegistroDptoEstado,String organizacionTelefono, String organizacionDireccionFisica,String organizacionCorreoElectronico,String organizacionPaginaWeb,String organizacionDireccionPostal,String organizacionReglamentoUrl)
	{
		boolean res;

		String lorganizacionD="0";
		int organizacionTipo_organizacionTiopoID =3;
		String table,values;
		table="organizacion";
		values="'"+lorganizacionD+"', '"+Pueblo_idPueblo+"', '"+organizacionTipo_organizacionTiopoID+"', '"+organizacionNombre+"', '"+organizacionRegistroDptoEstado+"', '"+organizacionTelefono+"', '"+organizacionDireccionFisica+"', '"+organizacionCorreoElectronico+"', '"+organizacionPaginaWeb+"', '"+organizacionDireccionFisica+"', '"+organizacionReglamentoUrl+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla categoria de la base de datos*/
	public boolean addCategoria( String categoria, String descripcion)
	{
		boolean res;

		String categoriaId="0";

		String table,values;
		table="categoria";
		values="'"+categoriaId+"', '"+categoria+"', '"+descripcion+"'" ;
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
/* esta funcion se utiliza para hacer un dropdown de todas las categorias que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listCategoria()
	{

		String field, table;
		table="categoria";
		field="*";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table);
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla evento de la base de datos*/
		public boolean addEvento(String eventoNombre , String eventoDescripcion, String categoria_categoriaId)
	{
		boolean res;

		String table,values;
		String eventoId="0";
		table="evento";
		values="'"+eventoId+"', '"+eventoNombre+"', '"+eventoDescripcion+"', '"+categoria_categoriaId+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para hacer un dropdown de todas las organizaciones que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listOrganizacion()
	{

		String field, table,whereClause;
		table="organizacion";
		field="lorganizacionD,organizacionNombre";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table);
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla competencia de la base de datos*/
	public boolean addCompetencia(String organizacion_lorganizacionD , String competenciaNombre, String competenciaFecha,String competenciaLugar)
	{
		boolean res;

		String table,values;
		String competenciaId="0";
		table="competencia";
		values="'"+competenciaId+"', '"+organizacion_lorganizacionD+"', '"+competenciaNombre+"', '"+competenciaFecha+"', '"+competenciaLugar+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para hacer un dropdown de todas las competencias que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listCompetencia()
	{

		String field, table,whereClause;
		table="competencia";
		field="competenciaId,competenciaNombre";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table);
	}
  //hace display de lo ultimo que se añadio en la tabla competencia
		public ResultSet displayMaxed()
	{

		String field,field1, table;
		table="competencia";
		field="competenciaId";
		field1 = "competenciaNombre";

		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectMaxed(field,field1, table);
	}

	/* esta funcion se utiliza para hacer un dropdown de eventos especificos bajo la competencia seleccionada que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listEvento()
	{

		String field, table,whereClause;
		table="evento,competenciaEventos";
		field="eventoId,eventoNombre";
		whereClause = "eventoId=evento_eventoId";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table, whereClause);
	}

	/* esta funcion se utiliza para hacer un dropdown de eventos de una categoria especificamente que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listEvento1()
	{

		String field, table,whereClause;
		table="evento,categoria";
		field="eventoId,eventoNombre,categoriaNombre";
		whereClause = "categoria_categoriaId=categoriaId ";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table, whereClause);
	}

	/* esta funcion se utiliza para hacer un dropdown de eventos bajo una categoria y evento que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listEvento2()
	{

		String field, table,whereClause;
		table="evento,categoria,competenciaEventos";
		field="eventoId,eventoNombre,categoriaNombre";
		whereClause = "categoria_categoriaId=categoriaId AND eventoId=evento_eventoId ";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table, whereClause);
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla competenciaEventos de la base de datos*/
	public boolean addCompetenciaEvento(String competencia_competenciaId, String evento_eventoId)
	{
		boolean res;

		String table,values;
		String competenciaEventosId="0";
		table="competenciaEventos";
		values="'"+competenciaEventosId+"', '"+competencia_competenciaId+"', '"+evento_eventoId+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla atleta de la base de datos*/
	public boolean addAtleta(String atletaNombre, String atletaSegundoNombre, String atletaApellidos, String atletaFechaNacimiento, String atletaGenero, String atletaCorreoElectronico,String atletaDireccionPostal, String  atletaTelefonos, String atletaPasaporteNumero, String  atletaPasaporteVencimiento, String atletaNombreEncargado, String atletaCompromisoEticoUrl, String atletaPoliticaConductaUrl )
	{
		boolean res;
		String table,values;
		String atletaId="0";
		table="atleta";
		values="'"+atletaId+"', '"+atletaNombre+"', '"+atletaSegundoNombre+"', '"+atletaApellidos+"', '"+atletaFechaNacimiento+"','"+atletaGenero+"', '"+atletaCorreoElectronico+"', '"+atletaDireccionPostal+"', '"+atletaTelefonos+"', '"+atletaPasaporteNumero+"', '"+atletaPasaporteVencimiento+"', '"+atletaNombreEncargado+"', '"+atletaCompromisoEticoUrl+"', '"+atletaPoliticaConductaUrl+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla atletaPueblo de la base de datos*/
	public boolean addAtletaPueblo(String Atleta_atletaId, String Pueblo_idPueblo, String atletaPuebloDireccion, String fecha)
	{
		boolean res;
		String table,values;
		String idAtletaPueblo="0";
		table="atletaPueblo";
		values="'"+idAtletaPueblo+"', '"+Atleta_atletaId+"', '"+Pueblo_idPueblo+"', '"+atletaPuebloDireccion+"', '"+fecha+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para sumarle 1 al id que no son autoincrement para igualarlo a otra tabla que utilize el mismo id*/
	public ResultSet displayMax1()
	{

		String field, table;
		table="atletaPueblo";
		field="Atleta_atletaId";

		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectMax(field, table);
	}

	/* esta funcion se utiliza para hacer un dropdown de los atletas que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listAtleta()
	{
		String field, table;
		table="Atleta";
		field="atletaId,atletaApellidos,atletaNombre";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table);
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla atletacompetencia de la base de datos*/
	public boolean addAtletaCompetencia(String competenciaEventos_competenciaEventosId,String Atleta_atletaId,String atletaCompetenciaResult, String atletaCompetenciaPosicion)
	{
		boolean res;
		String table, values;
		String atletaCompetenciaId="0";
		table="atletaCompetencia";
		values="'"+atletaCompetenciaId+"', '" +competenciaEventos_competenciaEventosId+"', '"+ Atleta_atletaId + "', '" + atletaCompetenciaResult + "', '"+atletaCompetenciaPosicion+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla atletaCertificadoMedico de la base de datos*/
	public boolean addCertificadomedico(String Atleta_atletaId,String atletaCertificadoMedicoURL,String atletaCertificadoMedicoFecha)
	{
		boolean res;
		String table, values;
		String atletaCertificadoMedicoId="0";
		table="atletaCertificadoMedico";
		values="'"+atletaCertificadoMedicoId+"', '"+Atleta_atletaId+"', '" +atletaCertificadoMedicoURL+"', '"+ atletaCertificadoMedicoFecha + "'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla Entrenamiento de la base de datos*/
	public boolean addEntrenamiento(String pueblo,String atleta,String lugar,String fecha,String comentarios)
	{
		boolean res;
		String table, values;
		String idEntrenamiento="0";
		table="Entrenamiento";
		values="'"+idEntrenamiento+"', '"+pueblo+"', '" +atleta+"', '"+lugar + "', '"+fecha + "','" +comentarios+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para hacer un dropdown del nivel de las licencias a los entrenadores o jueces que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listNivellicencia()
	{
		String field, table;
		table="nivelLicencia";
		field="nivelLicenciaId,licencia_licenciaId,nivelLicenciaNombre";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table);
	}

	/* esta funcion se utiliza para hacer un dropdown de las licencias que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listtipolicencia()
	{
		String field, table;
		table="licencia";
		field="licenciaId,licenciaDescripcion";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table);
	}

	/* esta funcion se utiliza para hacer un dropdown de las ocupaciones que no sean juez ni entrenador; se utiliza en las paginas que lo necesiten*/
	public ResultSet listOcupacion()
	{

		String field, table, whereClause;
		table="posicion";
		field="posicionId,posicionNombre";
		whereClause = "NOT posicionId = 3 AND NOT posicionId = 4";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}
	/* esta funcion se utiliza para hacer un dropdown de las ocupaciones que sean juez y entrenador; se utiliza en las paginas que lo necesiten*/
	public ResultSet listOcupacion1()
	{

		String field, table, whereClause;
		table="posicion";
		field="posicionId,posicionNombre";
		whereClause= "posicionId = 3 OR posicionId=4";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table, whereClause);
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla persona de la base de datos*/
	public boolean addPersona(String personaNombres,String personaApellidos,String personaFechaNacimiento,String personaCorreoElectronico,String personaDireccionFisica,String personaDireccionPostal,String personaPasaporte,String personaPasaporteExpiracion)
	{
		boolean res;
		String table, values;
		String personaId="0";
		table="persona";
		values="'"+personaId+"', '"+personaNombres+"', '" +personaApellidos+"', '"+ personaFechaNacimiento + "', '" + personaCorreoElectronico+ "', '" +personaDireccionFisica+"', '"+ personaDireccionPostal + "', '" + personaPasaporte+ "', '" + personaPasaporteExpiracion+ "'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla organizacionPersona de la base de datos*/
	public boolean addOrganizacionPersona(String organizacion_lorganizacionD, String persona_personaId,String posicion_posicionId, String fechaInicio,String fechaFinal)
	{
		boolean res;
		String table, values;
		table="organizacionPersona";
		values="'"+organizacion_lorganizacionD+"', '"+persona_personaId+"', '" +posicion_posicionId+"', '"+ fechaInicio + "', '" + fechaFinal+ "'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla personaNivelLicencia de la base de datos*/
	public boolean addPersonaNivelLicencia( String nivelLicencia_nivelLicenciaId, String persona_personaId,String fechaInicio,String fechaExpiracion)
	{
		boolean res;
		String table, values;
		table="personaNivelLicencia";
		values="'"+nivelLicencia_nivelLicenciaId+"', '"+persona_personaId+"', '" +fechaInicio+"', '"+fechaExpiracion+ "'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}

	/* esta funcion se utiliza para sumarle 1 al id que no son autoincrement para igualarlo a otra tabla que utilize el mismo id*/
	public ResultSet displayMax2()
	{

		String field, table;
		table="persona";
		field="personaId";

		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectMax(field, table);
	}
	/* esta funcion se utiliza para hacer un dropdown de los entrenadores que hay en la base de datos; se utiliza en las paginas que lo necesiten*/
	public ResultSet listEntrenador()
	{

		String field, table,whereClause;
		table="persona,posicion,organizacionPersona";
		field="personaId,PersonaNombres,personaApellidos";
		whereClause="posicionId=posicion_posicionId AND personaId=persona_personaId AND posicionId=3";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla planDeEntrenamiento de la base de datos*/
	public boolean addPlan( String persona_personaId, String Atleta_atletaId,String fechaPlanEntrenamiento,String urlPlanEntrenamiento)
	{
		boolean res;
		String table, values;
		String idplanDeEntrenamiento="0";
		table="planDeEntrenamiento";
		values="'"+idplanDeEntrenamiento+"', '"+persona_personaId+"', '" +Atleta_atletaId+"', '"+fechaPlanEntrenamiento+ "', '"+urlPlanEntrenamiento+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla atletaEntrenador de la base de datos*/

	public boolean addAtletaEntrenador(String persona_personaId,String Atleta_atletaId,String fechaInicio,String fechaFin)
	{
		boolean res;
		String table, values;
		String idatletaEntrenador="0";
		table="atletaEntrenador";
		values="'"+idatletaEntrenador+"', '"+persona_personaId+"', '" +Atleta_atletaId+"', '"+ fechaInicio + "', '" + fechaFin + "'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para hacer un dropdown de las vestimentas que hay en la base de datos; se utiliza en las paginas que lo necesiten*/

	public ResultSet listVestimenta()
	{

		String field, table;
		table="vestimenta";
		field="idVestimenta,descripcionVestimenta";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table);
	}

	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla atletaVestimenta de la base de datos*/
	public boolean addVestimenta1(String atleta,String vestimenta,String fecha)
	{
		boolean res;
		String table, values;
		table="atletaVestimenta";
		values="'"+atleta+ "','" +vestimenta+"', '"+fecha+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para añadir los atributos que fueron insertados en la pagina; se van a insertar en
	 la tabla Atleta_has_organizacion de la base de datos*/

	public boolean addAtleta_has_organizacion(String Atleta_atletaId,String organizacion_lorganizacionD,String fechaInicial, String fechaFinal)
	{
		boolean res;
		String table, values;
		table="Atleta_has_organizacion";
		values="'"+Atleta_atletaId+ "','" +organizacion_lorganizacionD+"', '"+fechaInicial+"', '"+fechaFinal+"'";
		res=myDBConn.doInsert(table, values);
		System.out.println("Insertion result" + res);
		return res;
	}
	/* esta funcion se utiliza para hacer un dropdown de las ligas que hay en la base de datos; se utiliza en las paginas que lo necesiten*/

	public ResultSet  listByLiga()
	{

		String field, table,whereClause;
		table="organizacion,organizacionPersona,posicion";
		field="organizacionNombre";
		whereClause="organizacion_lorganizacionD=lorganizacionD AND posicion_posicionId=posicionId AND organizacionTipo_organizacionTipoID=1 AND posicionId=5";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de todos los directores de una liga en particular con su informacion*/
	public ResultSet  listAllDirectivos()
	{

		String field, table,whereClause;
		table="organizacion,pueblo,persona,organizacionPersona,posicion";
		field="personaNombres,personaApellidos,posicionNombre,organizacionNombre,puebloNombre,organizacionRegistroDptoEstado,organizacionTelefono,organizacionDireccionFisica,organizacionDireccionPostal,organizacionCorreoElectronico,organizacionPaginaWeb,organizacionReglamentoUrl";
		whereClause="organizacionTipo_organizacionTipoId=1 AND Pueblo_idPueblo=idPueblo AND persona_personaId=personaId AND organizacion_lorganizacionD=lorganizacionD AND posicion_posicionId=posicionId AND posicionId=5";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de todos los directores de una liga escojida con su informacion*/
	public ResultSet  listByDirectivos(String liga)
	{

		String field, table,whereClause;
		table="organizacion,persona,posicion,organizacionPersona";
		field="personaNombres,personaApellidos,posicionNombre";
		whereClause="personaId=persona_personaId AND posicion_posicionId=posicionId AND organizacion_lorganizacionD=lorganizacionD AND posicionId=5 AND organizacionNombre= '"+liga+"'";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion se utiliza para hacer un dropdown de las ligas que tienen club que hay en la base de datos; se utiliza en las paginas que lo necesiten*/

	public ResultSet  listLigaByClub()
	{

		String field, table,whereClause;
		table="organizacion,clubLiga";
		field="lorganizacionD,organizacionNombre";
		whereClause="lorganizacionD=organizacion_lorganizacionLiga";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de todos las ligas segun el club escojido con su informacion*/

	public ResultSet  listLigaClub(String liga1)
	{

		String field, table,whereClause;
		table="organizacion, clubLiga,pueblo ";
		field="organizacionNombre,puebloNombre,organizacionRegistroDptoEstado,organizacionTelefono, organizacionDireccionFisica, organizacionDireccionPostal,organizacionCorreoElectronico, organizacionPaginaWeb,organizacionReglamentoUrl";
		whereClause="idPueblo=Pueblo_idPueblo AND   lorganizacionD=organizacion_lorganizacionClub  AND organizacion_lorganizacionLiga='"+liga1+"'";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de todos los jueces por liga con su informacion*/

	public ResultSet  listAllJuecesByLiga()
	{

		String field, table,whereClause;
		table="nivelLicencia,personaNivelLicencia,persona,organizacionPersona, posicion,licencia,organizacion";
		field="organizacionNombre, personaNombres,personaApellidos,posicionNombre,licenciaDescripcion, nivelLicenciaDescripcion,MAX(fechaExpiracion)";
		whereClause="lorganizacionD=organizacion_lorganizacionD AND  posicionId=posicion_posicionId AND persona.personaId=personaNivelLicencia.persona_personaId AND  nivelLicenciaId=nivelLicencia_nivelLicenciaId AND licenciaId=licencia_licenciaId AND  organizacionPersona.persona_personaId=persona.personaId AND  posicionId=4 AND  organizacionTipo_organizacionTipoID=1 GROUP BY personaNivelLicencia.persona_personaId";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de todos los entrenadores por club con su informacion*/

	public ResultSet  listEntrenadoresByClub()
	{

		String field, table,whereClause;
		table="nivelLicencia,personaNivelLicencia,persona,organizacionPersona, posicion,licencia,organizacion";
		field="organizacionNombre, personaNombres,personaApellidos,posicionNombre,licenciaDescripcion, nivelLicenciaDescripcion,MAX(fechaExpiracion)";
		whereClause="lorganizacionD=organizacion_lorganizacionD AND  posicionId=posicion_posicionId AND persona.personaId=personaNivelLicencia.persona_personaId AND  nivelLicenciaId=nivelLicencia_nivelLicenciaId AND licenciaId=licencia_licenciaId AND  organizacionPersona.persona_personaId=persona.personaId AND  posicionId=3 AND  organizacionTipo_organizacionTipoID=2 GROUP BY personaNivelLicencia.persona_personaId";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de todos los atletas por club con su informacion*/

	public ResultSet  listAtletaByClub()
	{

		String field, table,whereClause;
		table="organizacion,Atleta_has_organizacion, Atleta";
		field="atletaNombre,atletaApellidos,organizacionNombre";
		whereClause="atletaId=Atleta_atletaId AND organizacion_lorganizacionD=lorganizacionD AND  organizacionTipo_organizacionTipoID=2";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion se utiliza para hacer un dropdown de los entrenadores q tienen atelas*/

	public ResultSet  listEntrenadorAtleta()
	{

		String field, table,whereClause;
		table="persona,posicion,organizacionPersona";
		field="personaApellidos, PersonaNombres";
		whereClause="posicionId=posicion_posicionId  AND personaId=persona_personaId AND posicionId=3";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de todos los entrenadores asignados a un atleta con su informacion*/
	public ResultSet  listEntrenadorAtleta1(String entrenador)
	{

		String field, table,whereClause;
		table="Atleta,atletaEntrenador,persona,organizacionPersona,posicion";
		field="atletaNombre,atletaApellidos,personaNombres,personaApellidos";
		whereClause="atletaId=Atleta_atletaId AND atletaEntrenador.persona_personaId=persona.personaId AND  persona.personaId=organizacionPersona.persona_personaId AND posicionId=3 AND personaNombres='"+entrenador+"'";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}
	/* esta funcion se utiliza para hacer un dropdown de las competencias que esten disponibles que hay en la base de datos; se utiliza en las paginas que lo necesiten*/

	public ResultSet  listCompetenciaActual( String ncompetencia)
		{

		String field, table,whereClause;
		table="competencia";
		field="competenciaId, competenciaNombre";
		whereClause=" competenciaNombre='"+ncompetencia+"'";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}
		/* esta funcion muestra una tabla de las competencias con su informacion*/
		public ResultSet  ListCompAttributtes( String organizacion_lorganizacionD, String competenciaNombre, String competenciaFecha,  String competenciaLugar)
		{
		String field, table,whereClause;
		table="competencia";
		field="organizacion_lorganizacionD, competenciaNombre,competenciaFecha,competenciaLugar";
		whereClause=" organizacion_lorganizacionD='"+organizacion_lorganizacionD+"' AND competenciaNombre='"+competenciaNombre+"' AND competenciaFecha='"+competenciaFecha+"' AND competenciaLugar='"+competenciaLugar+"'";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}
	/* esta funcion muestra una tabla de los eventos de un atleta seleccionado*/

	public ResultSet  ListAtletaByEvento( String atletaId)
		{

		String field, table,whereClause;
		table="categoria,evento,competenciaEventos,atletaCompetencia,Atleta";
		field="atletaNombre,atletaApellidos,eventoNombre,categoriaNombre";
		whereClause=" atletaId=Atleta_atletaId AND competenciaEventosId=competenciaEventos_competenciaEventosId  AND eventoId=evento_eventoId AND categoriaId=categoria_categoriaId AND atletaId='"+atletaId+"'";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de los eventos de los atletas*/
	public ResultSet listeventoatleta()
	{

		String field, table,whereClause,orderBy;
		table="Atleta,atletaCompetencia,competenciaEventos,evento";
		field=" atletaId,atletaNombre,atletaApellidos";
		whereClause="eventoId=evento_eventoId AND competenciaEventosId=competenciaEventos_competenciaEventosId AND atletaId=Atleta_atletaId order by atletaId;";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectDistinct(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de las competencias de un atleta seleccionado*/

		public ResultSet  ListAtletaByCompetencia( String atletaId)
		{

		String field, table,whereClause;
		table="organizacion,competencia,competenciaEventos, atletacompetencia,Atleta";
		field="atletaNombre,atletaApellidos,competenciaNombre,atletaCompetenciaResult,atletaCompetenciaPosicion,competenciaFecha,competenciaLugar,organizacionNombre";
		whereClause=" atletaId=Atleta_atletaId AND competenciaEventosId=competenciaEventos_competenciaEventosId AND competenciaId=competencia_competenciaId AND lorganizacionD=organizacion_lorganizacionD AND atletaId='"+atletaId+"'";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}
	/* esta funcion muestra una tabla de las competencias de los atletas*/

	public ResultSet listCompetenciaAtleta()
	{

		String field, table,whereClause,orderBy;
		table="Atleta,atletaCompetencia,competenciaEventos,competencia";
		field=" atletaId,atletaNombre,atletaApellidos";
		whereClause="atletaId=Atleta_atletaId AND competenciaEventosId=competenciaEventos_competenciaEventosId AND competenciaId=competencia_competenciaId order By atletaId";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectDistinct(field, table,whereClause);
	}

	/* esta funcion muestra una tabla del atleta seleccionado con sus entrenadores*/

			public ResultSet  ListAtletaByEntrenador( String atletaId)
		{

		String field, table,whereClause;
		table="posicion,organizacionPersona,persona,atletaEntrenador,Atleta";
		field="atletaNombre,atletaApellidos,personaNombres,personaApellidos,posicionNombre,atletaEntrenador.fechaInicio,fechaFin";
		whereClause=" atletaId=Atleta_atletaId  AND persona.personaId=atletaEntrenador.persona_personaId  AND persona.personaId=organizacionPersona.persona_personaId  AND posicionId=posicion_posicionId AND posicion_posicionId=3 AND atletaId='"+atletaId+"'";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelect(field, table,whereClause);
	}

	/* esta funcion muestra una tabla de todos los atletas con sus entrenadores*/

	public ResultSet listEntrenadorAtleta2()
	{

		String field, table,whereClause,orderBy;
		table="Atleta,atletaEntrenador";
		field=" atletaId, atletaNombre,atletaApellidos";
		whereClause="atletaId=Atleta_atletaId order By atletaId";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectDistinct(field, table,whereClause);
	}

	/* esta funcion se utiliza para hacer un dropdown de los jueces y entrenadores que tengan licencias vigentes*/
		public ResultSet listActualEntrenadorAndJuez()
	{

		String field, table,whereClause;
		table="persona,personaNivelLicencia,organizacionPersona,posicion,organizacion";
		field=" personaId,personaNombres,personaApellidos,posicionNombre,organizacionNombre";
		whereClause="posicionId=posicion_posicionId AND persona.personaId=personaNivelLicencia.persona_personaId AND  persona.personaId=organizacionPersona.persona_personaId AND organizacion_lorganizacionD=lorganizacionD";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectDistinct(field, table,whereClause);
	}
	/* esta funcion muestra un dropdown de los jueces que han tenido licencias pasadas*/

	public ResultSet historialjueces()
	{
		String field, table,whereClause,orderBy;
		table="persona,personaNivelLicencia,organizacionPersona,posicion ";
		field="personaId,personaNombres,personaApellidos";
		whereClause="persona.personaId=personaNivelLicencia.persona_personaId AND persona.personaId=organizacionPersona.persona_personaId AND posicionId=posicion_posicionId AND posicion_posicionId=4 order By persona.personaId";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectDistinct(field, table,whereClause);
	}
	/* esta funcion muestra una tabla de los historiales de las licencias de un juez*/

		public ResultSet historialjueces1(String personaId)
	{
		String field, table,whereClause,orderBy;
		table="organizacion,organizacionPersona,posicion,persona,personaNivelLicencia,nivelLicencia,licencia ";
		field="personaNombres,personaApellidos,posicionNombre,licenciaDescripcion,nivelLicenciaNombre,organizacionNombre,personaNivelLicencia.fechaExpiracion ";
		whereClause="licenciaId=licencia_licenciaId AND nivelLicenciaId=nivelLicencia_nivelLicenciaId AND persona.personaId=personaNivelLicencia.persona_personaId AND persona.personaId=organizacionPersona.persona_personaId AND posicionId=posicion_posicionId AND organizacion_lorganizacionD=lorganizacionD AND persona.personaId="+personaId+" ORDER BY fechaExpiracion DESC";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectDistinct(field, table,whereClause);
	}
/* esta funcion muestra un dropdown de los entrenadores que han tenido licencias pasadas*/
	public ResultSet historialentrenador()
	{
		String field, table,whereClause,orderBy;
		table="persona,personaNivelLicencia,organizacionPersona,posicion ";
		field="personaId,personaNombres,personaApellidos ";
		whereClause="persona.personaId=personaNivelLicencia.persona_personaId AND persona.personaId=organizacionPersona.persona_personaId AND posicionId=posicion_posicionId AND posicion_posicionId=3 order By persona.personaId;";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectDistinct(field, table,whereClause);
	}
	/* esta funcion muestra una tabla de los historiales de las licencias de un entrenador*/

		public ResultSet historialentrenador1(String personaId)
	{
		String field, table,whereClause,orderBy;
		table="organizacion,organizacionPersona,posicion,persona,personaNivelLicencia,nivelLicencia,licencia ";
		field="personaNombres,personaApellidos,posicionNombre,licenciaDescripcion,nivelLicenciaNombre,organizacionNombre,personaNivelLicencia.fechaExpiracion ";
		whereClause="licenciaId=licencia_licenciaId AND nivelLicenciaId=nivelLicencia_nivelLicenciaId AND persona.personaId=personaNivelLicencia.persona_personaId AND persona.personaId=organizacionPersona.persona_personaId AND posicionId=posicion_posicionId AND organizacion_lorganizacionD=lorganizacionD AND persona.personaId="+personaId+" ORDER BY fechaExpiracion DESC";
		//Define the list fields list to retrieve assigned roles to the user
		System.out.println("listing...");
		return myDBConn.doSelectDistinct(field, table,whereClause);
	}






	/*********
		close method
			Close the connection to the database.
			This method must be called at the end of each page/object that instatiates a applicationDBManager object
			@parameters:
			@returns:
	*/
	public void close()
	{
		//Close the connection
		myDBConn.closeConnection();
	}

}
