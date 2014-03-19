<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ejemplo.Models.Ca_AccionesProcesales>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenido" runat="server">

<h2>Lista acciones procesales</h2>

<p>
    <%: Html.ActionLink("Crear nueva acción", "NuevaAccionProcesal") %>
</p>
<table>
    <tr>
        <th>ID etapa procesal</th>
        <th>ID sub etapa procesal</th>
        <th>ID acción</th>
        <th>ID acción procesal</th>
        <th>Descripción</th>
        <th>Usuario activo</th>
        <th>Fecha de actualización</th>
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
            <%: Html.ActionLink("Editar", "EditarAccion", new { /* id=item.PrimaryKey */ }) %> |
            <%: Html.ActionLink("Ver detalles", "DetallesAccion", new { id=item.Id_Accion}) %> |
            <%: Html.ActionLink("Borrar", "Delete", new { id=item.Id_Accion }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
