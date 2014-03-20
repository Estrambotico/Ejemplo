<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Plantilla/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <link href="../../Content/css/Maquetado.css" rel="stylesheet" />
        <div class="starter-template">
        <div style="background-color:white;width:1468px; height: 93px;">
            <div class="columna-izq">
            <h1>Solicitud de</h1><br />
            <h2>Actas del Registro Civil</h2>
            </div>
            <div class="columna-der">
                <img src="../../Img/volcanes-color.png"; width: "100px"; height: "100px";/>
            </div>
            <div class="barracentro verde">
                <div class="barracentroo verde2">
                    <span class="bmt">PASO 1</span>
                    <br />
                    <span class="bmsst">datos personales</span>
            </div></div>
            <div class="aviso amarillo">
                <div class="aviso amarillo"><img src="../../Img/icon-warning.png" class="alertimage" />
                    <span class="bmtt">NOTA: </span>
                    <span class="bmst">
                        requiere que la informacion proporcionada sea correcta para poder proporcionar un servicios de calidad</span>
            </div></div>
          <div class="botones">
              <div class="botones2">
                  <img src="../../Img/Imagen2.png" class="alertimage2"></img>
                    Contactanos
              </div> 
          </div>
            <div class="botones">
              <div class="botones3">
                  <img src="../../Img/Imagen1.png" class="alertimage2"></img>
                    Descargar Manual
              </div> 
          </div>
           <div class="barraceentro">
               <div class="barraceentro2">
                <form class="form-horizontal">
                    <fieldset>
                    <!-- Form Name -->
                    <!-- Select Basic -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="selectbasic">Tipo de Documento</label>
                      <div class="col-md-4">
                        <select id="selectbasic" name="selectbasic" class="form-control">
                          <option value="1">NACIMIENTO</option>
                        </select>
                      </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="textinput">Nombre(s)</label>  
                      <div class="col-md-8">
                      <input id="textinput" name="textinput" type="text" placeholder="Sin acentos" class="form-control input-md">
    
                      </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="textinput">Primer Apellido</label>  
                      <div class="col-md-8">
                      <input id="text1" name="textinput" type="text" placeholder="Sin acentos" class="form-control input-md">
    
                      </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="textinput">Segundo Apellido</label>  
                      <div class="col-md-8">
                      <input id="text2" name="textinput" type="text" placeholder="Sin acentos" class="form-control input-md">
                       
                      </div>
                    </div>

                    <!-- Text input-->
                      <div class="form-group">
                      <label class="col-md-4 control-label" for="textinput">Fecha de Nacimiento</label> 
                          <div class="col-md-4"> 
                      <input id="text3" name="textinput" type="text" placeholder="NACIMIENTO" class="form-control input-md">  
                     </div><button id="button1id" name="button1id" class="btn btn-default">Mostrar Acta</button>
                        <button id="button2id" name="button2id" class="btn btn-default">Siguiente</button>
                          </div>

                    </fieldset>
                    </form>
               <div class="pdf">
                   <div class="soloimagen">
                    <img src="../../Img/get_adobe_reader.png" class="pdfimage" />
                    </div><div class="solotexto" >
                    Para que el sitio funione orrectamente es necesario tener instalado el Acrobat Reader. Haz click aqui para instalarlo.
                    </div>
               </div>
                
                </div>
           </div>
            <div class="footer row">
                <div class="col-md-3 foot">
                    <img src="../../Img/icono_gobierno.png" class="logoGob"/></br>
                    Complejo Adminsitrativo del Gobierno del Estado . 3er. Anillo Periferico, Esq. Ejercito Mexicano.S/N. Colonia el Diezmo Tel. (312)316 2000 C.P. 28010, Colima, Colima, Mexico
                </div>
                <div class="col-md-3 foot">
                    <ul>
                        <li>Tramites y Servicios</li>
                        <li>&nbsp;&nbsp;&nbsp;Lista de tramites y servicios en linea</li>
                        <li>&nbsp;&nbsp;&nbsp;Catalogo de tramites y servicios</li>
                    </ul>
                </div>
                <div class="col-md-3 foot">
                    <ul>
                        <li>Transparencia</li>
                        <li>Gobierno</li>
                        <li>&nbsp;&nbsp;&nbsp;Gabinete</li>
                        <li>&nbsp;&nbsp;&nbsp;Secretarias</li>
                        <li>&nbsp;&nbsp;&nbsp;H. Congreso de Estado</li>
                        <li>&nbsp;&nbsp;&nbsp;Supremo Tribunal de Justicia</li>
                        <li>&nbsp;&nbsp;&nbsp;Periodico Oficial</li>
                        <li>&nbsp;&nbsp;&nbsp;Municipios</li>
                        <li>&nbsp;&nbsp;&nbsp;Estructura Organica</li>
                        <li>&nbsp;&nbsp;&nbsp;Organismos desconcentrados, descentralizados y autonomos</li>
                        <li>Educacion</li>
                    </ul>
                </div>
                <div class="col-md-3 foot">
                    <ul>
                        <li>Negocios</li>
                        <li>Turismo</li>
                        <li>Cultura</li>
                        <li>Seguridad</li>
                        <li>&nbsp;&nbsp;&nbsp;Proteccion Civil</li>
                        <li>&nbsp;&nbsp;&nbsp;Procuraduria General de Justicia</li>
                        <li>&nbsp;&nbsp;&nbsp;Secretaria de Seguridad Publica</li>
                    </ul>
                </div>

            </div>
                
        </div>
    </div>

</asp:Content>
