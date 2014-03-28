using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
using System.Xml;
using System.Configuration;
using System.Net;

namespace Ejemplo.Models
{
    public class ServiceConsumer
    {

        /// <summary>
        ///  Método que obtiene información general de una persona en base a su CURP
        /// </summary>
        /// <param name="CURP">Clave Única de Registro de Población</param>
        /// <returns> Retorna una estructura del tipo CURP Datos. Contiene información de datos Generales.</returns>
        public CURPDatos CURPtoDatos(string CURP)
        {
            string usuario = ConfigurationManager.AppSettings.Get("UserService");
            string password = ConfigurationManager.AppSettings.Get("PasswordService");
            string URLService = ConfigurationManager.AppSettings.Get("CURPService");
            CURPDatos regresa = new CURPDatos();
            try
            {
                //Petición WEB
                HttpWebRequest request = WebRequest.Create(URLService + CURP) as HttpWebRequest;
                request.Method = "GET";
                // Authenticación del servicio para la petición
                request.Credentials = new NetworkCredential(usuario, password);
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }
                //// Tratamiento de XML resultante.
                // Ruta --> NodoRoot/NodoContendor
                /**************************************/
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode dato = doc.SelectSingleNode("/xml/Nombre");
                regresa.NOMBRE = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/CURP");
                regresa.CURP = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Apellido");
                regresa.APELLIDO1 = dato.InnerText;

                dato = dato.NextSibling;
                regresa.APELLIDO2 = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Entidad");
                regresa.ENTIDAD = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Entidad");
                regresa.ENTIDAD = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Sexo");
                regresa.SEXO = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Nacionalidad");
                regresa.NACIONALIDAD = dato.InnerText;

                regresa.EXITO = true;
                regresa.MENSAJE = "Proceso realizado correctamente";

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna el mensaje por el cual se generó el error.
                regresa.EXITO = false;
                regresa.MENSAJE = " el proceso no se llevó a cabo devido a: " + e.Message;
            }

            return regresa;
        }

        /// <summary>
        ///  Método que obtiene la CURP de una persona en base a sus datos
        /// </summary>
        /// <param name="apellido1"></param>
        /// <param name="apellido2"></param>
        /// <param name="estado"></param>
        /// <param name="fecha"></param>
        /// <param name="nombre"></param>
        /// <param name="sexo"></param>
        /// <returns> Retorna una estructura del tipo CURP Datos. Contiene información de datos Generales.</returns>
        public CURPDatos DatosToCURP(string nombre, string apellido1, string apellido2, string estado, string fecha, string sexo)
        {
            string usuario = ConfigurationManager.AppSettings.Get("UserService");
            string password = ConfigurationManager.AppSettings.Get("PasswordService");
            string URLService = ConfigurationManager.AppSettings.Get("CURPIService");
            CURPDatos regresa = new CURPDatos();
            try
            {
                string datos = nombre + "/" + apellido1 + "/" + apellido2 + "/" + estado + "/" + fecha + "/" + sexo + "/";
                //Petición WEB
                HttpWebRequest request = WebRequest.Create(URLService + datos) as HttpWebRequest;
                request.Method = "GET";
                // Authenticación del servicio para la petición
                request.Credentials = new NetworkCredential(usuario, password);
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }
                //// Tratamiento de XML resultante.
                // Ruta --> NodoRoot/NodoContendor
                /**************************************/
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode dato = doc.SelectSingleNode("/xml/Nombre");
                regresa.NOMBRE = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/CURP");
                regresa.CURP = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Apellido");
                regresa.APELLIDO1 = dato.InnerText;

                dato = dato.NextSibling;
                regresa.APELLIDO2 = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Entidad");
                regresa.ENTIDAD = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Fecha_Nac");
                regresa.FECHA_NAC = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Sexo");
                regresa.SEXO = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/Nacionalidad");
                regresa.NACIONALIDAD = dato.InnerText;

                regresa.EXITO = true;
                regresa.MENSAJE = "Proceso realizado correctamente";

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna el mensaje por el cual se generó el error.
                regresa.EXITO = false;
                regresa.MENSAJE = " el proceso no se llevó a cabo debido a: " + e.Message;
            }

            return regresa;
        }

        /// <summary>
        /// Retorna información de las todas las entidades de este país
        /// </summary>
        /// <returns>Regresa una lista de la estructura entidades.</returns>
        public List<ENTIDADES> ListaEntidades()
        {
            string URLService = ConfigurationManager.AppSettings.Get("ListaEntidades");
            List<ENTIDADES> regresa = new List<ENTIDADES>();
            try
            {
                //Petición WEB
                HttpWebRequest request = WebRequest.Create(URLService) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNodeList ListaEntidades = doc.SelectNodes("/xml/item");
                foreach (XmlNode dato in ListaEntidades)
                {
                    ENTIDADES entidad = new ENTIDADES();
                    XmlNode nodo = dato.SelectSingleNode("cve_Entidades");
                    entidad.CLAVE = nodo.InnerText;

                    nodo = dato.SelectSingleNode("descrip_Entidades");
                    entidad.ENTIDAD = nodo.InnerText;

                    nodo = dato.SelectSingleNode("siglas_Entidades");
                    entidad.SIGLAS = nodo.InnerText;

                    regresa.Add(entidad);
                }

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new List<ENTIDADES>();
            }

            return regresa;
        }

        /// <summary>
        /// Retorna información de los municipios DE LA ENTIDAD INDICADA
        /// </summary>
        /// <param name="IdEntidad">Id de la Entidad</param>
        /// <returns>Regresa una lista de la estructura municipios.</returns>
        public List<MUNICIPIOS> ListaMunicipios(string IdEntidad)
        {
            string URLService = ConfigurationManager.AppSettings.Get("ListaMunicipios");
            List<MUNICIPIOS> regresa = new List<MUNICIPIOS>();
            try
            {
                //Petición WEB
                string peticion = URLService;
                if (!string.IsNullOrEmpty(IdEntidad))
                {
                    peticion += IdEntidad;
                }
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNodeList ListaMpios = doc.SelectNodes("/xml/item");
                foreach (XmlNode dato in ListaMpios)
                {

                    MUNICIPIOS mpio = new MUNICIPIOS();

                    XmlNode nodo = dato.SelectSingleNode("cve_Municipios");
                    mpio.CLAVE_MUNICIPIO = nodo.InnerText;

                    nodo = dato.SelectSingleNode("descrip_Municipios");
                    mpio.MUNICIPIO = nodo.InnerText;

                    nodo = dato.SelectSingleNode("cveEntidades_Municipios");
                    mpio.CLAVE_ENTIDAD = nodo.InnerText;

                    nodo = dato.SelectSingleNode("descrip_Entidades");
                    mpio.ENTIDAD = nodo.InnerText;

                    regresa.Add(mpio);
                }

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new List<MUNICIPIOS>();
            }

            return regresa;
        }

        /// <summary>
        /// Retorna información de las localidades del municipio indicado
        /// </summary>
        /// <param name="cveMunicipio">Clave del municipio</param>
        /// <returns>Regresa una lista de la estructura localidades.</returns>
        public List<LOCALIDADES> ListaLocalidades(string cveMunicipio)
        {
            string URLService = ConfigurationManager.AppSettings.Get("ListaLocalidades");
            List<LOCALIDADES> regresa = new List<LOCALIDADES>();
            try
            {
                //Petición WEB
                string peticion = URLService;
                if (!string.IsNullOrEmpty(cveMunicipio))
                {
                    peticion += cveMunicipio;
                }
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNodeList ListaLoc = doc.SelectNodes("/xml/item");
                foreach (XmlNode dato in ListaLoc)
                {

                    LOCALIDADES loc = new LOCALIDADES();

                    XmlNode nodo = dato.SelectSingleNode("cve_Localidades");
                    loc.CVE_LOCALIDAD = nodo.InnerText;

                    nodo = dato.SelectSingleNode("cveMunicipios_Localidades");
                    loc.CVE_MUNICIPIO = nodo.InnerText;

                    nodo = dato.SelectSingleNode("nombre_Localidades");
                    loc.LOCALIDAD = nodo.InnerText;

                    regresa.Add(loc);
                }

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new List<LOCALIDADES>();
            }

            return regresa;
        }

        /// <summary>
        /// Retorna información de las colonias de la localidad indicada
        /// </summary>
        /// <param name="cveLocalidad">Cve de la Localidad</param>
        /// <returns>Regresa una lista de la estructura colonias.</returns>
        public List<COLONIAS> ListaColonias(string cveLocalidad)
        {
            string URLService = ConfigurationManager.AppSettings.Get("ListaColonias");
            List<COLONIAS> regresa = new List<COLONIAS>();
            try
            {
                //Petición WEB
                string peticion = URLService;
                if (!string.IsNullOrEmpty(cveLocalidad))
                {
                    peticion += cveLocalidad;
                }
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNodeList ListaCol = doc.SelectNodes("/xml/item");
                foreach (XmlNode dato in ListaCol)
                {

                    COLONIAS col = new COLONIAS();

                    XmlNode nodo = dato.SelectSingleNode("cve_Colonias");
                    col.CVE_COLONIA = nodo.InnerText;

                    nodo = dato.SelectSingleNode("cveLocalidad_Colonias");
                    col.CVE_LOCALIDAD = nodo.InnerText;

                    nodo = dato.SelectSingleNode("cveNombreColonias_Colonias");
                    col.CVENOMBRE_COLONIA = nodo.InnerText;

                    nodo = dato.SelectSingleNode("nombre_NombresColonias");
                    col.NOMBRE_COLONIA = nodo.InnerText;

                    nodo = dato.SelectSingleNode("nombre_Localidades");
                    col.NOMBRE_LOCALIDAD = nodo.InnerText;

                    nodo = dato.SelectSingleNode("cp_Colonias");
                    col.CP = nodo.InnerText;

                    regresa.Add(col);
                }

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new List<COLONIAS>();
            }

            return regresa;
        }

        /// <summary>
        /// Retorna información de las calles de la colonia indicada
        /// </summary>
        /// <param name="cveColonia">Colonia</param>
        /// <returns>Regresa una lista de la estructura calles.</returns>
        public List<CALLES> ListaCalles(string cveColonia)
        {
            string URLService = ConfigurationManager.AppSettings.Get("ListaCalles");
            List<CALLES> regresa = new List<CALLES>();
            try
            {
                //Petición WEB
                string peticion = URLService;
                if (!string.IsNullOrEmpty(cveColonia))
                {
                    peticion += cveColonia;
                }
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNodeList ListaCall = doc.SelectNodes("/xml/item");
                foreach (XmlNode dato in ListaCall)
                {

                    CALLES ca = new CALLES();

                    XmlNode nodo = dato.SelectSingleNode("cve_Calles");
                    ca.CVE_CALLE = nodo.InnerText;

                    nodo = dato.SelectSingleNode("cveColonias_Calles");
                    ca.CVE_COLONIA = nodo.InnerText;

                    nodo = dato.SelectSingleNode("cveNombresCalles_Calles");
                    ca.CVE_NOMBRECALLE = nodo.InnerText;

                    nodo = dato.SelectSingleNode("cp_Colonias");
                    ca.CP = nodo.InnerText;

                    nodo = dato.SelectSingleNode("nombre_NombresCalles");
                    ca.NOMBRE_CALLE = nodo.InnerText;

                    regresa.Add(ca);
                }

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new List<CALLES>();
            }
            return regresa;
        }

        /// <summary>
        /// Regresa los datos de la entidad indicada
        /// </summary>
        /// <param name="cveEntidad">cve de la Entidad</param>
        public ENTIDADES getEntidad(string cveEntidad)
        {
            string URLService = ConfigurationManager.AppSettings.Get("Entidad");
            ENTIDADES regresa = new ENTIDADES();
            try
            {
                string peticion = URLService + cveEntidad;
                //Petición WEB
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode Entidad = doc.SelectSingleNode("/xml/item");
                XmlNode nodo;

                nodo = Entidad.SelectSingleNode("cve_Entidades");
                regresa.CLAVE = nodo.InnerText;

                nodo = Entidad.SelectSingleNode("descrip_Entidades");
                regresa.ENTIDAD = nodo.InnerText;

                nodo = Entidad.SelectSingleNode("siglas_Entidades");
                regresa.SIGLAS = nodo.InnerText;

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new ENTIDADES();
            }

            return regresa;
        }

        /// <summary>
        /// Regresa los datos del municipio indicada
        /// </summary>
        /// <param name="cveMunicipio">Clave del municipio</param>
        public MUNICIPIOS getMunicipio(string cveMunicipio)
        {
            string URLService = ConfigurationManager.AppSettings.Get("Municipio");
            MUNICIPIOS regresa = new MUNICIPIOS();
            try
            {
                string peticion = URLService + cveMunicipio;
                //Petición WEB
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode Mpios = doc.SelectSingleNode("/xml/item");
                XmlNode nodo;

                nodo = Mpios.SelectSingleNode("cve_Municipios");
                regresa.CLAVE_MUNICIPIO = nodo.InnerText;

                nodo = Mpios.SelectSingleNode("descrip_Municipios");
                regresa.MUNICIPIO = nodo.InnerText;

                nodo = Mpios.SelectSingleNode("cveEntidades_Municipios");
                regresa.CLAVE_ENTIDAD = nodo.InnerText;

                nodo = Mpios.SelectSingleNode("descrip_Entidades");
                regresa.ENTIDAD = nodo.InnerText;

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new MUNICIPIOS();
            }

            return regresa;
        }

        /// <summary>
        /// Regresa los datos del localidad indicada
        /// </summary>
        /// <param name="cveLocalidad">Clave de la Localidad</param>
        public LOCALIDADES getLocalidad(string cveLocalidad)
        {
            string URLService = ConfigurationManager.AppSettings.Get("Localidad");
            LOCALIDADES regresa = new LOCALIDADES();
            try
            {
                string peticion = URLService + cveLocalidad;
                //Petición WEB
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode element = doc.SelectSingleNode("/xml/item");
                XmlNode nodo;

                nodo = element.SelectSingleNode("cve_Localidades");
                regresa.CVE_LOCALIDAD = nodo.InnerText;

                nodo = element.SelectSingleNode("cveMunicipios_Localidades");
                regresa.CVE_MUNICIPIO = nodo.InnerText;

                nodo = element.SelectSingleNode("nombre_Localidades");
                regresa.LOCALIDAD = nodo.InnerText;

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new LOCALIDADES();
            }

            return regresa;
        }

        /// <summary>
        /// Regresa los datos de la colonia indicada
        /// </summary>
        /// <param name="cveColonia">Clave de la Colonia</param>
        public COLONIAS getColonia(string cveColonia)
        {
            string URLService = ConfigurationManager.AppSettings.Get("Colonia");
            COLONIAS regresa = new COLONIAS();
            try
            {
                string peticion = URLService + cveColonia;
                //Petición WEB
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode element = doc.SelectSingleNode("/xml/item");
                XmlNode nodo;

                nodo = element.SelectSingleNode("cve_Colonias");
                regresa.CVE_COLONIA = nodo.InnerText;

                nodo = element.SelectSingleNode("cveLocalidad_Colonias");
                regresa.CVE_LOCALIDAD = nodo.InnerText;

                nodo = element.SelectSingleNode("cveNombreColonias_Colonias");
                regresa.CVENOMBRE_COLONIA = nodo.InnerText;

                nodo = element.SelectSingleNode("nombre_NombresColonias");
                regresa.NOMBRE_COLONIA = nodo.InnerText;

                nodo = element.SelectSingleNode("nombre_Localidades");
                regresa.NOMBRE_LOCALIDAD = nodo.InnerText;

                nodo = element.SelectSingleNode("cp_Colonias");
                regresa.CP = nodo.InnerText;

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new COLONIAS();
            }

            return regresa;
        }

        /// <summary>
        /// Regresa los datos de la calle req
        /// </summary>
        /// <param name="cveCalle">Clave de la Calle</param>
        public CALLES getCalle(string cveCalle)
        {
            string URLService = ConfigurationManager.AppSettings.Get("Calle");
            CALLES regresa = new CALLES();
            try
            {
                string peticion = URLService + cveCalle;
                //Petición WEB
                HttpWebRequest request = WebRequest.Create(peticion) as HttpWebRequest;
                request.Method = "GET";
                string xml;
                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                // Tratamiento del xml correspondiente a la petición
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode element = doc.SelectSingleNode("/xml/item");
                XmlNode nodo;

                nodo = element.SelectSingleNode("cve_Calles");
                regresa.CVE_CALLE = nodo.InnerText;

                nodo = element.SelectSingleNode("cveColonias_Calles");
                regresa.CVE_COLONIA = nodo.InnerText;

                nodo = element.SelectSingleNode("cveNombresCalles_Calles");
                regresa.CVE_NOMBRECALLE = nodo.InnerText;

                nodo = element.SelectSingleNode("cp_Colonias");
                regresa.CP = nodo.InnerText;

                nodo = element.SelectSingleNode("nombre_NombresCalles");
                regresa.NOMBRE_CALLE = nodo.InnerText;

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new CALLES();
            }

            return regresa;
        }

        /// <summary>
        /// Usa el ws para insertar una nueva Colonia
        /// </summary>
        /// <param name="cp">CP</param>
        /// <param name="cveLocalidad">Localidad a la que pertenece la Colonia</param>
        /// <param name="colonia">Nombre de la colonia</param>
        public COLONIAS insertaColonia(string cveLocalidad, string colonia, int cp)
        {
            string URLService = ConfigurationManager.AppSettings.Get("InsertaColonia");
            string usuario = ConfigurationManager.AppSettings.Get("UserService");
            string password = ConfigurationManager.AppSettings.Get("PasswordService");
            COLONIAS regresa = new COLONIAS();
            try
            {
                string peticion = URLService;
                StringBuilder data = new StringBuilder();
                data.Append(URLService);
                data.Append(HttpUtility.UrlEncode(cveLocalidad));
                data.Append("/" + HttpUtility.UrlEncode(colonia));
                data.Append("/" + HttpUtility.UrlEncode(cp.ToString().Trim()));

                //Petición WEB
                HttpWebRequest request = WebRequest.Create(data.ToString()) as HttpWebRequest;
                request.Method = "POST";

                request.Credentials = new NetworkCredential(usuario, password);

                string xml;

                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                //// Tratamiento de XML resultante.
                // Ruta --> NodoRoot/NodoContendor
                /**************************************/
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode dato = doc.SelectSingleNode("/xml/item/cve_Colonias");
                regresa.CVE_COLONIA = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/item/cveLocalidad_Colonias");
                regresa.CVE_LOCALIDAD = doc.InnerText;


                regresa = getColonia(regresa.CVE_COLONIA);


                regresa.EXITO = true;
                regresa.MENSAJE = "Proceso realizado correctamente";

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new COLONIAS();
                regresa.EXITO = false;
                regresa.MENSAJE = "El proceso no se llevó a cabo debido a: " + e.Message;
            }

            return regresa;
        }

        /// <summary>
        /// Usa el ws para insertar una nueva Calle
        /// </summary>
        /// <param name="cp">CP</param>
        /// <param name="cveLocalidad">Localidad a la que pertenece la Colonia</param>
        /// <param name="colonia">Nombre de la colonia</param>
        public CALLES insertaCalle(string cveColonia, string calle)
        {
            string URLService = ConfigurationManager.AppSettings.Get("InsertaCalle");
            string usuario = ConfigurationManager.AppSettings.Get("UserService");
            string password = ConfigurationManager.AppSettings.Get("PasswordService");
            CALLES regresa = new CALLES();
            try
            {
                string peticion = URLService;
                StringBuilder data = new StringBuilder();
                data.Append(URLService);
                data.Append(HttpUtility.UrlEncode(cveColonia));
                data.Append("/" + HttpUtility.UrlEncode(calle));

                //Petición WEB
                HttpWebRequest request = WebRequest.Create(data.ToString()) as HttpWebRequest;
                request.Method = "POST";

                request.Credentials = new NetworkCredential(usuario, password);

                string xml;

                // Obtención del response
                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    // Captura del Stream del response
                    StreamReader reader = new StreamReader(response.GetResponseStream());
                    // Obtención de la salida de datos.
                    xml = reader.ReadToEnd();
                }

                //***********************************************
                //// Tratamiento de XML resultante.
                // Ruta --> NodoRoot/NodoContendor
                /**************************************/
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(xml);

                XmlNode dato = doc.SelectSingleNode("/xml/item/cve_Calles");
                regresa.CVE_CALLE = dato.InnerText;

                dato = doc.SelectSingleNode("/xml/item/cveColonias_Calles");
                regresa.CVE_COLONIA = doc.InnerText;

                regresa = getCalle(regresa.CVE_CALLE);

                regresa.EXITO = true;
                regresa.MENSAJE = "Proceso realizado correctamente";

            }
            catch (Exception e)
            {
                // En caso de excepción retonar, se retorna la estructura sin regsitros.
                regresa = new CALLES();
                regresa.EXITO = false;
                regresa.MENSAJE = "El proceso no se llevó a cabo debido a: " + e.Message;
            }

            return regresa;
        }


    }

    public struct CURPDatos
    {
        public string CURP;
        public string NOMBRE;
        public string APELLIDO1;
        public string APELLIDO2;
        public string ENTIDAD;
        public string FECHA_NAC;
        public string SEXO;
        public string NACIONALIDAD;
        public bool EXITO;
        public string MENSAJE;
    }

    public struct ENTIDADES
    {
        public string ENTIDAD { get; set; }
        public string CLAVE { get; set; }
        public string SIGLAS { get; set; }
        public bool EXITO { get; set; }
        public string MENSAJE { get; set; }
    }

    public struct MUNICIPIOS
    {
        public string MUNICIPIO { get; set; }
        public string CLAVE_MUNICIPIO { get; set; }
        public string CLAVE_ENTIDAD { get; set; }
        public string ENTIDAD { get; set; }
        public bool EXITO { get; set; }
        public string MENSAJE { get; set; }
    }

    public struct LOCALIDADES
    {
        public string CVE_LOCALIDAD { get; set; }
        public string CVE_MUNICIPIO { get; set; }
        public string LOCALIDAD { get; set; }
        public bool EXITO { get; set; }
        public string MENSAJE { get; set; }
    }

    public struct COLONIAS
    {
        public string CVE_COLONIA { get; set; }
        public string CVE_LOCALIDAD { get; set; }
        public string CVENOMBRE_COLONIA { get; set; }
        public string NOMBRE_COLONIA { get; set; }
        public string NOMBRE_LOCALIDAD { get; set; }
        public string CP { get; set; }
        public bool EXITO { get; set; }
        public string MENSAJE { get; set; }
    }

    public struct CALLES
    {
        public string CVE_CALLE { get; set; }
        public string CVE_COLONIA { get; set; }
        public string CVE_NOMBRECALLE { get; set; }
        public string CP { get; set; }
        public string NOMBRE_CALLE { get; set; }
        public bool EXITO { get; set; }
        public string MENSAJE { get; set; }
    }

}