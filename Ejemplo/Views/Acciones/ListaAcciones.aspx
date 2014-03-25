<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ejemplo.Models.Ca_AccionesProcesales>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href="../../Content/colorbox/colorbox.css" rel="stylesheet" />
     <script src="../../Scripts/Carranza.js"></script>
    <script src="../../Scripts/DataTable/jquery.js"></script>
    <script src="../../Scripts/jquery.colorbox-min.js"></script>
    <script src="../../Scripts/DataTable/jquery.dataTables.js"></script>
       <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   
    <link href="../../Content/DataTable/jquery.dataTables.css" rel="stylesheet" />
    
    <div class="container">
        <div class="row starter-template titulo">
            <div class="col-md-12 letra_titulo">
                <h2>Lista de Acciones Procesales</h2>
            </div>
        </div>
        <br />
        
        <div class="row">
            <div class="col-md-12">
                
            </div>
        </div>
<table id="tableOne" class="display" width="100%" style="margin: 1% auto;">
    <thead>
       
    <tr>
        <th colspan="2">
               Nueva<a href="/Acciones/NuevaAccionProcesal" class="ajax">
                        <img src="../../Content/Imagenes/add.png" class="ImgNuevo" title="Dar de alta nuevo.."
                            alt="Dar de alta nuevo" /></a>
        </th>
        <th colspan="2">
             <%: Html.ActionLink("Generar PDF", "PDF") %>
        </th>
    </tr>
    <tr>
       
        <th>
            ACCION PROCESAL
          
        </th>
        <th>DESCRIPCION
        
        </th>
       
        <th>FECHA
           
        </th>
        <th></th>
    </tr>
    </thead>
    <tbody>
<% foreach (var item in Model) { %>
    <tr>
       
        <td>
            <%: Html.DisplayFor(modelItem => item.id_AccionProcesal) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Descripcion) %>
        </td>
        
        <td>
            <%: Html.DisplayFor(modelItem => item.Fecha_Act) %>
        </td>
        <td>
            <%: Html.ActionLink("Editar", "Editar", new {Id_Accion=item.id_AccionProcesal}, new { @class="ajax" }) %> |
            <%: Html.ActionLink("Detalles", "DetallesAccion", new { Id_Accion = item.id_AccionProcesal }, new { @class="ajax" })%>
            
          |
            <%: Html.ActionLink("Eliminar", "EliminarAccion", new { Id_Accion = item.id_AccionProcesal }, new { @class = "eliminar" })%>
           
           
         
        </td>
         
    </tr>
       
        
<% } %>
    </tbody>
    <tfoot>
            <tr><th rowspan="1" colspan="1"><input type="text" name="search_engine" value="Accion procesal" class="search_init"></th>
                <th rowspan="1" colspan="1"><input type="text" name="search_browser" value="Descripcion" class="search_init"></th>
                <th rowspan="1" colspan="1"><input type="text" name="search_platform" value="Fecha" class="search_init"></th>
                <th></th>

            </tr>
        </tfoot>
</table>
        
         <div class="row footer">

                <div class="col-md-3">
                    <img src="http://www.colima-estado.gob.mx/cfg/imagenes/img/img_pie_escudogobierno.png" alt="gobierno del estado libre y soberano de colima" width="162" height="79" border="0">
                    <h6>Complejo Administrativo del Gobierno del Estado 3er anillo Periferico, Esq. Ejercito Mexicano S/N Colonia el Diezmo Tel
                        (312) 316 2000 CP 28010, Colima, Colima, Mexico
                    </h6>
                    
                    <img src="http://www.colima-estado.gob.mx/cfg/imagenes/ico/ico_separacion2.png" alt="Icon" width="199" height="2"> 
                </div>
                <div class="col-md-3">
                    <ul>Trámites y servicios
                        <ol>
                            <ul>Lista de trámites y servicios en linea</ul>
                            <ul>Catálogo de trámites y servicios</ul>
                        </ol>
                    </ul>
                   
                    
                    </div>
                <div class="col-md-3">
                   
                    <ul>
                         Gobierno
                        <ol>
                            <ul>Gabinete</ul>
                                <ul>
                                    Secretarías
                                </ul>
                                <ul>H. congreso del estado</ul>
                                <ul>
                                    Supremo tribunal de justicia
                            
                                </ul>
                                <ul>Periódico oficial

                                </ul>
                                <ul>
                                    Municipios
                                </ul>
                                <ul>
                                    Estructura orgánica
                                </ul>
                                <ul>
                                    Organismos desconcentrados, descentralizados y autónomos
                                </ul>
                            </ul>
                        </ol>
                    </ul>
                       
                   
                    <ul>
                        
                    </ul>
                                         
                   
                </div>
                <div class="col-md-3">
                    <h6>
                        Negocios<br />
                        Turismoa<br />
                        Cultura<br />
                        Seguridad<br />
                        Proteccion civil<br />

                    </h6>
                   
                </div>



            </div>
    </div>
     <script type="text/javascript">
         var asInitVals = new Array();
         $(document).ready(function () {
             $(".ajax").colorbox().resize({ width: "600px", height: "600px" });
             var tabla = $('#tableOne').dataTable({
                 
                 "sPaginationType": "full_numbers",
               
                
                 "oLanguage": {
                     "oPaginate": {
                         "sPrevious": "Anterior",
                         "sNext": "Siguiente",
                         "sLast": "Ultima",
                         "sFirst": "Primera"
                     },

                     "sLengthMenu": 'Mostrar <select>' +
                     '<option value="5">5</option>' +
                     '<option value="10">10</option>' +
                     '<option value="20">20</option>' +
                     '<option value="30">30</option>' +
                     '<option value="40">40</option>' +
                     '<option value="50">50</option>' +
                     '<option value="-1">Todos</option>' +
                     '</select> registros',

                     "sInfo": "Mostrando del _START_ a _END_ (Total: _TOTAL_ resultados)",

                     "sInfoFiltered": " - filtrados de _MAX_ registros",

                     "sInfoEmpty": "No hay resultados de búsqueda",

                     "sZeroRecords": "No hay registros a mostrar",

                     "sProcessing": "Espere, por favor...",

                     "sSearch": "Buscar:",

                 }
            });
            $("tfoot input").keyup(function () {
                /* Filter on the column (the index) of this element */
                tabla.fnFilter(this.value, $("tfoot input").index(this));
            });



             /*
              * Support functions to provide a little bit of 'user friendlyness' to the textboxes in 
              * the footer
              */
            $("tfoot input").each(function (i) {
                asInitVals[i] = this.value;
            });

            $("tfoot input").focus(function () {
                if (this.className == "search_init") {
                    this.className = "";
                    this.value = "";
                }
            });

            $("tfoot input").blur(function (i) {
                if (this.value == "") {
                    this.className = "search_init";
                    this.value = asInitVals[$("tfoot input").index(this)];
                }
            });
            
             $(".eliminar").on("click", function (e) {
                
                 e.preventDefault();
                 if (confirm('¿Seguro que desea eliminar?')) {
                     var url = $(this).attr('href');
                     $.ajax({
                         type: "GET",
                         datatype: "json",
                         url: url,

                         success: function (result) {
                             if (result.Exito == false) {
                                 alert("'Error" + Mensaje + "'");
                             }
                             else {
                                 alert('Registro elimado correctamente');
                                 $(this).parent().parent().remove();
                                 window.open("/Acciones/ListaAcciones", "_self");
                              
                                 
                             }
                             
                         }

                     });

                 }
                 else {
                     return false;}

                 
                
             });

         });

</script>



</asp:Content>
