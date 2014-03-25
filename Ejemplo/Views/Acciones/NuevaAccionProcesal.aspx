<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_AccionesProcesales>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>NuevaAccionProcesal</title>
      <!------------- JQUERY  ------------------>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="../../Content/js/bootstrap.min.js"></script>
      <script src="../../Scripts/Carranza.js"></script>

    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../Content/css/bootstrap.css" rel="stylesheet" />
      <link href="../../Content/css/Estilo.css" rel="stylesheet" />
      <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
      <link href="../../Content/css/Estilo_responsive.css" rel="stylesheet" />
</head>
<body>
    <div class="container" style="width:700px">
         <div class="row starter-template titulo">
            <div class="col-md-12 letra_titulo">
                <h2>Nueva accion procesal</h2>
            </div>
        </div>
        

               

            <% using (Html.BeginForm("NuevaAccionProcesal", "Acciones", FormMethod.Post, new { id="frm_nueva_accion"}))
               { %>
                <%: Html.ValidationSummary(true)%>

                <fieldset>
                    <div class="row" style="text-align:center">
                        <div class="form-horizontal">
                            <div class="form-group">
                                 
                                     
                            </div>
                            <div class="form-group">
                                            <table align="center">
                                                <tr>
                                                    <th>
                                                         <label >Etapa procesal</label>
                                                    </th>
                                                    <th>
                                                         <% var etapas = ViewData["Etapas"] as List<Ejemplo.Models.Ca_AccionesProcesales>;  %>
                                                        <%: Html.DropDownList("Id_Etapa_Procesal", new SelectList(etapas, "Id_Etapa_Procesal", "Descripcion"), "---Seleccione---", new {style = "width: 450px;"  })%>
                   
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th> <label>SubEtapa procesal</label></th>
                                                    <th> <select id="Id_SubEtapa_Procesal" name="Id_SubEtapa_Procesal" class="txt_gd">
                                                            <option value="0">---Seleccione---</option>
                                                        </select>

                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        <label>Descripcion</label>
                                                    </th>
                                                    <th>
                                                         <%: Html.TextAreaFor(model => model.Descripcion, new {style = "width: 400px; height: 80px;"  })%>
                                <%: Html.ValidationMessageFor(model => model.Descripcion)%>
                                                    </th>
                                                </tr>
                                            </table>
                                        
                                   
                                        
                                                           
                                 
                            </div>
                            <div class="form-group">
                                            
                                            
                                   
                                        
                                  
                                
                            </div>
                            <div class="form-group">
                               
                      <br />
                         <button id="btn_guardar" type="button" class="btn btn-primary" >Guardar</button><br />
                          <%: Html.ActionLink("Regresar a la lista", "ListaAcciones") %>
                            </div>
                        </div>
                    </div>

                    
                    

                </fieldset>
            <% } %>

  </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Id_Etapa_Procesal").on("change", function () {
                ajaxJson("/Acciones/ListaSubEtapas/", { Etapa: $(this).val() }, "Id_SubEtapa_Procesal", 0, callBackLlenarSelect);

            });

            $("#btn_guardar").on("click", function () {

                $.ajax({
                    type: "POST",
                    datatype: "json",
                    url: "/Acciones/NuevaAccionProcesal/",
                    data: $("#frm_nueva_accion").serialize(),
                    success: function (result) {
                        if (result.Exito == false) {
                            alert("'Error" + Mensaje + "'");
                        }
                        else {
                        }
                        alert('Registro agregado correctamente');
                    }

                });
            });

        });

</script>
</body>
</html>
