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
    <script src="<%: Url.Content("~/Scripts/jquery-1.7.1.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    <script src="../../Scripts/DataTable/jquery.dataTables.js"></script>
    <script src="../../Scripts/jquery.colorbox-min.js"></script>
    
    <% using (Html.BeginForm(Html.BeginForm("EditarGrupo", "Delitos", FormMethod.Post, new { id = "frm_editar_grupo" }))) { %>
        <%: Html.ValidationSummary(true) %>
        <%= Html.Hidden("pos",ViewData["pos"]) %>
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
                    url: "/Delitos/EditarGrupo",
                    data: $("#frm_editar_grupo").serialize(),
                    success: function (result) {
                        if (result.Exito == false) {
                            alert("'Error" + result.Mensaje + "'");
                        }
                        else {
                            alert('Registro modificado correctamente');

                            filtrar();
                            //var tablas = $('#tableOne').dataTable();
                            //var t = $("#tabla").dataTable();

                            //t.fnUpdate([$("#Descripcion").val(), '', ''], 22);
                            //window.open("/Delitos/Index", "_self");
                            /*var cla = $("#Id_Clasificacion1").val();

                            var url = "/Delitos/ListaGrupos/?" + "cla=" + cla;
                           
                           
                            $.ajax({
                                url: url,
                                dataType: 'html',
                                timeout: 5000, // 5 seconds
                                success: function (html) {
                                    $("#div_tabla").html(html);
                                }
                            });*/
                           
                            
                        }

                    }

                });
            });

        });

</script>
</body>
</html>
