<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<!DOCTYPE html>

<html>
<head runat="server">
   

    <meta name="viewport" content="width=device-width" />
    <title>Nuevo Delito</title>
   
</head>
<body>
    <script src="<%: Url.Content("~/Scripts/jquery-1.7.1.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"></script>
    <% using (Html.BeginForm("NuevoDelito", "Delitos", FormMethod.Post, new { id = "frm_nuevo_delito" }))
       { %>
        <%: Html.ValidationSummary(true) %>
    
        <fieldset>
            <legend>Nuevo delito</legend>
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
                        <label>Grupo</label>
                    </th>
                    <th>
                       <select id="id_Grupo" name="Id_Grupo">
                              <option value="0">---Seleccione---</option>
                        </select>

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
                    <th colspan="2">
                         <input id="btn_guardar" type="submit" class="btn btn-primary" value="GUARDAR" />
                    </th>
                </tr>
                <tr>
                    <th colspan="2">
                         <%: Html.ActionLink("Regresar a la lista", "IndexDelitos") %>
                    </th>
                </tr>
            </table>
    </div>   
              
           
        </fieldset>
    <% } %>
    
    

      <script type="text/javascript">
          $(document).ready(function () {
              $("#Id_Clasificacion").on("change", function () {
                 
                  ajaxJson("/Delitos/SelectGrupos/", { cla: $(this).val() }, "id_Grupo", 0, callBackLlenarSelect);

              });

              $("#frm_nuevo_delito").on("submit", function (e) {
                  e.preventDefault();
              });

              $("#btn_guardar").on("click", function () {
                 
                  $.ajax({
                      type: "POST",
                      datatype: "json",
                      url: "/Delitos/NuevoDelito/",
                      data: $("#frm_nuevo_delito").serialize(),
                      success: function (result) {
                          if (result.Exito == false) {
                              alert("'Error" + result.Mensaje + "'");
                          }
                          else {
                              alert('Registro agregado correctamente');
                              window.open("/Delitos/IndexDelitos", "_self");
                          }

                      }

                  });
              });

          });

</script>
</body>
</html>
