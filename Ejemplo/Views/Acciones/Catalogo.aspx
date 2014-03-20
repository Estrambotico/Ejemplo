<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Plantilla/Master.Master" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_AccionesProcesales>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="../../Content/css/Maquetado.css" rel="stylesheet" />
        <div class="starter-template">
        <div style="background-color:white;width:1468px; height: 93px;">
            <div class="columna-izq">
            <h1>Catalogo de </h1><br />
            <h2>Acciones Procesales</h2>
            </div>
            <div class="columna-der">
                <img src="../../Img/volcanes-color.png"; width: "100px"; height: "100px";/>
            </div>
            <div class="barracentro verde">
                </div>
           <div class="barraceentro">
               <div class="barraceentro2">
                <form class="form-horizontal" method="post" id="FormAcciones" name="FormAcciones">
                    <fieldset>
                    <!-- Form Name -->
                    <!-- Select Basic -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="selectbasic">Etapa Procesal</label>
                      <div class="col-md-4">
                        <% var etapas = ViewData["etapas"] as List<Ejemplo.Models.Ca_AccionesProcesales>; %>
                        <%: Html.DropDownList("Id_Etapa_Procesal", new SelectList(etapas,"Id_Etapa_Procesal","Descripcion"),"Seleccione", "required class = 'Form-control'") %>
                      </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="selectbasic">Sub-Etapa Procesal</label>
                      <div class="col-md-4">
                        <select id="Id_SubEtapa_Procesal" name="Id_SubEtapa_Procesal" required>
                            
                        </select>
                      </div>
                    </div>
                       <!-- Text input-->
                      <div class="form-group">
                      <label class="col-md-4 control-label" for="textinput">Descripcion</label> 
                          <div class="col-md-4"> 
                      <input id="Descripcion" name="Descripcion" type="text" class="form-control input-md">  
                     </div><input id="guardar" name="guardar" class="btn btn-default" value="Guardar"/>
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
    <script src="../../Scripts/Carranza.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#Id_Etapa_Procesal").on("change", function () {
            ajaxJson("/Acciones/ListaSubEtapas/", { "Etapa": $(this).val() }, "Id_SubEtapa_Procesal", 0, callBackLlenarSelect);
        });
    });
    $("#FormAcciones").submit(function (e) {
        e.preventDefault();
    });
    $("input#guardar").click(function () {
        $.ajax({
            type: "POST",
            url: "/Acciones/NuevaAccionProcesal",
            data: $("#FormAcciones").serialize(),
            success: function (data) {
                if (data.Exito == false) {
                    alert(data.Mensaje);
                } else {
                    $("#FormAcciones")[0].reset();
                    alert("Se almaceno Correctamente");
                }
            }
        });
    });
</script>


</asp:Content>