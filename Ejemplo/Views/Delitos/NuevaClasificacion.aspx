<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>NuevaClasificacion</title>
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery-1.7.1.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    
    <% using (Html.BeginForm("NuevaClasificacion", "Delitos", FormMethod.Post, new { id = "frm_nueva_cla" }))
       { %>
        <%: Html.ValidationSummary(true) %>
    
        <fieldset>
            <legend>Nueva clasificacion</legend>
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
                    <th colspan="2" align="center">
                         <button id="btn_guardar" type="button" class="btn btn-primary" >Guardar</button>
                    </th>
                </tr>
                <tr>
                    <th colspan="2" align="center">
                         <%: Html.ActionLink("Regresar a la lista", "ListaClasificacion") %>
                    </th>
                </tr>
            </table>
    </div>   
              
           
        </fieldset>
    <% } %>
    

     <script type="text/javascript">
         $(document).ready(function () {
             

             $("#btn_guardar").on("click", function () {

                 $.ajax({
                     type: "POST",
                     datatype: "json",
                     url: "/Delitos/NuevaClasificacion/",
                     data: $("#frm_nueva_cla").serialize(),
                     success: function (result) {
                         if (result.Exito == false) {
                             alert("'Error" + Mensaje + "'");
                         }
                         else {
                             alert('Registro agregado correctamente');
                             window.open("/Delitos/ListaClasificacion","_self");
                         }
                         
                     }

                 });
             });

         });

</script>
</body>
</html>
