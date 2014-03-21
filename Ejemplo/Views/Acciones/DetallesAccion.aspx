<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_AccionesProcesales>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>DetallesAccion</title>
</head>
<body>
    <fieldset>
        <legend>Ca_AccionesProcesales</legend>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Id_Etapa_Procesal) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Id_Etapa_Procesal) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Id_SubEtapa_Procesal) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Id_SubEtapa_Procesal) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Id_Accion) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Id_Accion) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.id_AccionProcesal) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.id_AccionProcesal) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Descripcion) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Descripcion) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Usu_Act) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Usu_Act) %>
        </div>
    
        <div class="display-label">
            <%: Html.DisplayNameFor(model => model.Fecha_Act) %>
        </div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Fecha_Act) %>
        </div>
    </fieldset>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
</body>
</html>
