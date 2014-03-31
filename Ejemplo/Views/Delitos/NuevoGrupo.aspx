<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    
    <title>NuevoGrupo</title>
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery-1.7.1.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
   
    
    <% using (Html.BeginForm("NuevoGrupo", "Delitos", FormMethod.Post, new { id = "frm_nuevo_grupo" }))
       { %>
        <%: Html.ValidationSummary(true) %>
    
        <fieldset>
            <legend>Nuevo grupo</legend>
    <div class="row" style="text-align:center">

            <table align="center">
                <tr>
                 <th>
                      <label >Clasificacion</label>
                 </th>
             <th>
                   <% var etapas = ViewData["Cla"] as List<Ejemplo.Models.Ca_Delitos>;  %>
                   <%: Html.DropDownList("Id_Clasificacion", new SelectList(etapas, "Id_Clasificacion", "Descripcion"), "---Seleccione---")%>
                   
                  </th>
            </tr>
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
                         <input id="btn_guardar" type="submit" class="btn btn-primary" value="Guardar" >
                    </th>
                </tr>
                <tr>
                    <th colspan="2" align="center">
                         <%: Html.ActionLink("Regresar a la lista", "ListaGrupos") %>
                    </th>
                </tr>
            </table>
    </div>   
              
           
        </fieldset>
    <% } %>
    
   

     <script type="text/javascript">
         $(document).ready(function () {


             $("#frm_nuevo_grupo").on("submit", function (e) {
                 e.preventDefault();
             });
             $("#btn_guardar").on("click", function () {
                 $.ajax({
                     type: "POST",
                     datatype: "json",
                     url: "/Delitos/NuevoGrupo/",
                     data: $("#frm_nuevo_grupo").serialize(),
                     success: function (result) {
                         if (result.Exito == true) {
                             alert('Registro agregado correctamente');
                             window.open("/Delitos/Index", "_self");
                              /*var cla = $("#Id_Clasificacion1").val();

                              var url = "/Delitos/ListaGrupos/?" + "cla=" + cla;

                              $('#div_tabla').load(url);*/
                         }
                         else {
                            alert("'Error" + result.Mensaje + "'");
                         }

                     }

                 });

             });

         });

</script>
</body>
</html>
