<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Plantilla/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ejemplo.Models.Ca_AccionesProcesales>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Content/css/Maquetado.css" rel="stylesheet" />
 <div class="starter-template">
        <div style="background-color:white;width:1468px; height: 93px;">
            <div class="columna-izq">
            <h1>Solicitud de </h1><br />
            <h2>Acciones Procesales</h2>
            </div>
            <div class="columna-der">
                <img src="../../Img/volcanes-color.png"; width: "100px"; height: "100px";/>
            </div>
            <div class="barracentro verde">
                </div>
           <div class="tabla">
              <script type="text/javascript">
                  $(document).ready(function () {
                      $("#tableOne").tablesorter({ debug: false, sortList: [], widgets: ['zebra'] })
                                      .tablesorterPager({ container: $("#pagerOne"), positionFixed: false })
                                      .tablesorterFilter({
                                          filterContainer: $("#filterBoxOne"),
                                          filterClearContainer: $("#filterClearOne"),
                                          filterColumns: [0, 1, 2, 3],  // Agregar tantos como campos necesarios
                                          filterCaseSensitive: false
                                      });

                  });
                </script>
                   <p>
                        <%: Html.ActionLink("Create New", "Create") %>
                    </p>
                    <table id="tableOne" class="yui"  style="margin: 1% auto; width:100%">
    <thead>
        <tr>
            <td class="tableHeader" colspan="5">
                    Nueva cena<a href="/Dinner/NuevaCena">
                        <img src="../../Content/Table/Mas.png" width="32px" height ="32px" class="ImgNuevo" title="Nueva cena"
                            alt="Dar de alta nueva cena" /></a>
                </td>
                <td colspan="5" class="filter" style="border-right: solid 1px #7f7f7f;">
                    Buscar: <input name="text"  value="" maxlength="30" size="30" type="text" />
                    <img id="filterClearOne" src="../../Content/Table/cross.png" width="32px"  style="cursor:pointer" height ="32px" title="Clic para limpiar el filtro."
                        alt="Clear Filter Image" />   
                                </td>
                            </tr>
                        <tr>
                            <th>
                                Etapa Procesal
                            </th>
                            <th>
                                Sub-Etapa Procesal
                            </th>
                            <th>
                                Accion
                            </th>
                            <th>
                                AccionProcesal
                            </th>
                            <th>
                                Descripcion
                            </th>
                            <th>
                                Usu_Act
                            </th>
                            <th>
                                Fecha_Act
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
                                <%: Html.ActionLink("Edit", "Edit", new { /* id=item.PrimaryKey */ }) %> |
                                <%: Html.ActionLink("Details", "Details", new { /* id=item.PrimaryKey */ }) %> |
                                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ }) %>
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
                                        </select>
                                    </td>
                                </tr>
                            </tfoot>
                    </table>         
                </div>        
                
        </div>
    </div>

</asp:Content>
