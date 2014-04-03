<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>DetallesDelitos</title>
</head>
<body>
    <fieldset>
        <legend>Detalles delitos</legend>
    
        
             <table class="tabla">
                <tr>
                    <th class="tdtop">
                        <label>Descripcion</label>
                    </th>
                    <th>
                        <%: Html.TextAreaFor(model => model.Descripcion) %>
                         <%: Html.ValidationMessageFor(model => model.Descripcion) %>
                    </th>
                </tr>
                <tr>
                    <th>

                    </th>
                    <th>
                        <%: Html.HiddenFor(model => model.Id_Delito2) %>
                        <%: Html.HiddenFor(model => model.Id_Delito) %>
                        <%: Html.HiddenFor(model => model.Id_Clasificacion) %>
                        <%: Html.HiddenFor(model => model.Id_Grupo) %>
                        <%: Html.HiddenFor(model => model.Usu_Act) %>
                    </th>
                </tr>                
            </table>
     
    </fieldset>
    
</body>
</html>
