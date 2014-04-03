<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>EditarClasificacion</title>
</head>
<body>
    
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    
    <% using (Html.BeginForm(Html.BeginForm("EditarClasificacion", "Delitos", FormMethod.Post, new { id = "frm_editar_cla" }))) { %>
        <%: Html.ValidationSummary(true) %>
    
        <fieldset>
            <legend>Editar clasificacion</legend>
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
                        <%: Html.HiddenFor(model => model.Id_Delito2) %>
                        <%: Html.HiddenFor(model => model.Id_Delito) %>
                        <%: Html.HiddenFor(model => model.Id_Clasificacion) %>
                        <%: Html.HiddenFor(model => model.Id_Grupo) %>
                        <%: Html.HiddenFor(model => model.Usu_Act) %>
                    </th>
                </tr>
                <tr>
                    <th colspan="2">
                        <br />
                         <button id="btn_guardar" type="button" class="btn btn-primary" >Guardar</button>
                    </th>
                </tr>
            </table>        
        </fieldset>
    <% } %>
    
   

    <script type="text/javascript">
        $(document).ready(function () {

            $("#btn_guardar").on("click", function () {

                $.ajax({
                    type: "POST",
                    datatype: "json",
                    url: "/Delitos/EditarClasificacion/",
                    data: $("#frm_editar_cla").serialize(),
                    success: function (result) {
                        if (result.Exito == false) {
                            alert("'Error" + result.Mensaje + "'");
                        }
                        else {
                            alert('Registro modificado correctamente');
                            window.open("/Delitos/ListaClasificacion", "_self");
                        }

                    }

                });
            });

        });

</script>
</body>
</html>
