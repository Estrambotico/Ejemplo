<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
     <link href="../../Content/colorbox/colorbox.css" rel="stylesheet" />
    <link href="../../Content/DataTable/jquery.dataTables.css" rel="stylesheet" />
    <title>EditarGrupo</title>
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    <script src="../../Scripts/DataTable/jquery.dataTables.js"></script>
    <script src="../../Scripts/jquery.colorbox-min.js"></script>
    
    <% using (Html.BeginForm(Html.BeginForm("EditarGrupo", "Delitos", FormMethod.Post, new { id = "frm_editar_grupo" }))) { %>
        <%: Html.ValidationSummary(true) %>
        <%= Html.Hidden("pos",ViewData["pos"]) %>
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
                    url: "/Delitos/EditarGrupo",
                    data: $("#frm_editar_grupo").serialize(),
                    success: function (result) {
                        if (result.Exito == false) {
                            alert("'Error" + result.Mensaje + "'");
                        }
                        else {
                            alert('Registro modificado correctamente');

                            filtrar();
                                                       
                        }

                    }

                });
            });

        });

</script>
</body>
</html>
