<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ejemplo.Models.Ca_AccionesProcesales>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
            </div>
        </div>
<table class="normal">
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
            <%: Html.ActionLink("Editar", "Edit", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Detalles", "Details", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Eliminar", "EliminarAccion", new { Id_Accion=item.id_AccionProcesal }) %>
        </td>
    </tr>
<% } %>

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
