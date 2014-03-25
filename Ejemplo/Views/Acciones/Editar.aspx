<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_AccionesProcesales>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Editar</title>
   
     <!------------- HOJAS DE ESTILO CSS  ------------------>
<link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../Content/css/bootstrap.css" rel="stylesheet" />
      <link href="../../Content/css/Estilo.css" rel="stylesheet" />
      <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
      <link href="../../Content/css/Estilo_responsive.css" rel="stylesheet" />
      
  <!------------- JQUERY  ------------------>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="../../Content/js/bootstrap.min.js"></script>
      <script src="../../Scripts/Carranza.js"></script>
</head>
<body>
   <div class="container" style="width:600px">
        <div class="row starter-template titulo">
            <div class="col-md-12 letra_titulo">
                <h2>Accion procesal</h2>
            </div>
        </div>
      
        
   
   

<% using (Html.BeginForm("EditarAccion", "Acciones", FormMethod.Post, new { id = "frm_nueva_accion" }))
   { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Ediar acciones procesales </legend>

         <div class="row" style="text-align:center">
             <div class="form-horizontal">
                 <div class="form-group">
                     <div class="editor-label" >
                        <label>Descripcion</label><br />
                        
                         <%: Html.TextAreaFor(model => model.Descripcion, new {style = "width: 270px; height: 105px;"  })%>
                    </div>
                    <div class="editor-field text " >
                        
                       
                        <%: Html.ValidationMessageFor(model => model.Descripcion) %>
                    </div>

                 </div>
                 <div class="form-group">
                       <button id="btn_guardar" type="button" class="btn btn-primary" >Guardar</button>
                 </div>
             </div>
       </div>
      
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Id_Etapa_Procesal) %>
           
        </div>
        
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Id_SubEtapa_Procesal) %>
           
        </div>
        
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Id_Accion) %>
           
        </div>

        
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.id_AccionProcesal) %>
           
        </div>

        

       
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Usu_Act) %>
         
        </div>

       
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Fecha_Act) %>
        
        </div>

       <p>
                      
                       
                    </p>
    </fieldset>
<% } %>

        <div>
            <%: Html.ActionLink("Regresar a la lista", "ListaAcciones") %>
        </div>
  </div>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#btn_guardar").on("click", function () {
               
                $.ajax({
                    type: "POST",
                    datatype: "json",
                    url: "/Acciones/EditarAccion/",
                    data: $("#frm_nueva_accion").serialize(),
                    success: function (result) {
                        if (result.Exito == false) {
                            alert("'Error" + result.Mensaje + "'");
                        }
                        else {
                            alert('Registro modificado correctamente');
                            window.open("/Acciones/ListaAcciones", "_self");
                        }
                       
                    }

                });
            });

        });

</script>
</body>
</html>
