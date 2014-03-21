<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ejemplo.Models.Ca_AccionesProcesales>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/TableSorterStyle.css" rel="stylesheet" />
      <link href="../../Content/Table_Style.css" rel="stylesheet" />
      <link href="../../Content/TableStyle.css" rel="stylesheet" />
    <link href="../../Content/colorbox/colorbox.css" rel="stylesheet" />
    <script src="../../Scripts/jquery.colorbox-min.js"></script>
    <script src="../../Scripts/jquery.colorbox.js"></script>
     <script src="../../Scripts/Carranza.js"></script>
      <script src="../../Scripts/jquery.tablesorter.js"></script>
      <script src="../../Scripts/jquery.tablesorter.pager.js"></script>
      <script src="../../Scripts/jquery.tablesorter.widgets.js"></script>
      <script src="../../Scripts/jquery.tablesorter.filer.js"></script>
       <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {

             $(".ajax").colorbox();
             $("#tableOne").tablesorter({ debug: false, sortList: [], widgets: ['zebra'] })
                       .tablesorterPager({ container: $("#pagerOne"), positionFixed: false })
                       .tablesorterFilter({
                           filterContainer: $("#filterBoxOne"),
                           filterClearContainer: $("#filterClearOne"),
                           filterColumns: [0, 1, 2, 3],  // Agregar tantos como campos necesarios
                           filterCaseSensitive: false
                       });



         });
         $(function () {
             var name = $("#name"),
               email = $("#email"),
               password = $("#password"),
               allFields = $([]).add(name).add(email).add(password),
               tips = $(".validateTips");

            

             $("#dialog-form").dialog({
                 autoOpen: false,
                 height: 300,
                 width: 350,
                 modal: true,
                 buttons: {
                     "Create an account": function () {
                         
                     },
                     Cancel: function () {
                         $(this).dialog("close");
                     }
                 },
                 close: function () {
                     allFields.val("").removeClass("ui-state-error");
                 }
             });

             $("#create-user")
               .button()
               .click(function () {
                   $("#dialog-form").dialog("open");
               });
         });

</script>
    <div class="container">
        <div class="row starter-template titulo">
            <div class="col-md-12 letra_titulo">
                <h2>Lista de Acciones Procesales</h2>
            </div>
        </div>
        <br />
        
        <div class="row">
            <div class="col-md-12">
                 <%: Html.ActionLink("Nueva", "NuevaAccionProcesal") %>
                <button id="create-user">Create new user</button>
            </div>
        </div>
<table id="tableOne" class="yui" width="100%" style="margin: 1% auto;">
    <thead>
        <tr>
            <td class="tableHeader" colspan="4">
                    Nueva cena<a href="/Acciones/NuevaAccionProcesal/">
                        <img src="../../Content/Imagenes/add.png" width="32px" height ="32px" class="ImgNuevo" title="Nueva cena"
                            alt="Dar de alta nueva accion" /></a>
                </td>
                <td colspan="4" class="filter" style="border-right: solid 1px #7f7f7f;">
                    Buscar: <input name="text"  value="" maxlength="30" size="30" type="text" />
                    <img id="filterClearOne" src="../../Content/Imagenes/clear.png" width="32px"  style="cursor:pointer" height ="32px" title="Clic para limpiar el filtro."
                        alt="Clear Filter Image" />   
                </td>
            </tr>
    
    <tr>
        <th>
            ID_E
          
        </th>
        <th>
            ID_SUB
           
        </th>
        <th>
            ID_ACCION
         
        </th>
        <th>
            ACCION PRO
          
        </th>
        <th>DESCRIPCION
        
        </th>
        <th>USUARIO
           
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
            <%: Html.DisplayFor(modelItem => item.Id_Etapa_Procesal) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Id_SubEtapa_Procesal) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Id_Accion) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.id_AccionProcesal) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Descripcion) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Usu_Act) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Fecha_Act) %>
        </td>
        <td>
            <%: Html.ActionLink("Editar", "Editar", new {Id_Accion=item.id_AccionProcesal}) %> |
            <a class='ajax' href="/Acciones/DetallesAccion/000001" title="Detalles">Detalles</a>
          |
            <%: Html.ActionLink("Eliminar", "EliminarAccion", new { Id_Accion = item.id_AccionProcesal })%>
         
        </td>
    </tr>
<% } %>
    </tbody>
    <tfoot>
            <tr id="pagerOne">
                <td colspan="10" style="border-right: solid 1px #7f7f7f;">
                    <img src="../../Content/Table/first.png" class="first" alt="" width="32px" height ="32px" style="cursor:pointer" />
                    <img src="../../Content/Table/prev.png" class="prev" alt="" width="32px" height ="32px" style="cursor:pointer"/>
                    <input type="text" class="pagedisplay" />
                    <img src="../../Content/Table/next.png" class="next" alt="" width="32px" height ="32px" style="cursor:pointer"/>
                    <img src="../../Content/Table/last.png" class="last" alt="" width="32px" height ="32px" style="cursor:pointer"/>
                    <select class="pagesize">
                        <option selected="selected" value="10">10</option>
                        <option selected="selected" value="5">5</option>
                    </select>
                </td>
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



</asp:Content>
