<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>EditarGrupo</title>
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery-1.7.1.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    <% using (Html.BeginForm(Html.BeginForm("EditarGrupo", "Delitos", FormMethod.Post, new { id = "frm_editar_grupo" }))) { %>
        <%: Html.ValidationSummary(true) %>
    
        <fieldset>
            <legend>Editar clasificacion</legend>
    
              
            
            <div class="row" style="text-align:center">

            <table align="center">
                 
                <tr>
                    <th>
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
                       
                        <%: Html.HiddenFor(model => model.Usu_Act) %>
                    </th>
                </tr>
                <tr>
                    <th colspan="2">
                         <button id="btn_guardar" type="button" class="btn btn-primary" >Guardar</button>
                    </th>
                </tr>
            </table>
    </div>   
            
        </fieldset>
    <% } %>
    
    <div>
        <%: Html.ActionLink("Regresar a la lista", "Index") %>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {

            $("#btn_guardar").on("click", function () {

                $.ajax({
                    type: "POST",
                    datatype: "json",
                    url: "/Delitos/EditarGrupo/",
                    data: $("#frm_editar_grupo").serialize(),
                    success: function (result) {
                        if (result.Exito == false) {
                            alert("'Error" + result.Mensaje + "'");
                        }
                        else {
                            alert('Registro modificado correctamente');
                            window.open('Delitos/Index');
                        }

                    }

                });
            });

        });

</script>
</body>
</html>
