<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_AccionesProcesales>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar</h2>

<% using (Html.BeginForm("EditarAccion", "Acciones", FormMethod.Post, new { id = "frm_nueva_accion" }))
   { %>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Ediar acciones procesales </legend>

      
      
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

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Descripcion) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Descripcion) %>
            <%: Html.ValidationMessageFor(model => model.Descripcion) %>
        </div>

       
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Usu_Act) %>
         
        </div>

       
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.Fecha_Act) %>
        
        </div>

       <p>
                        <button id="btn_guardar" type="button" class="btn btn-primary" >Guardar</button>
                       
                    </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Regresar a la lista", "ListaAcciones") %>
</div>
    <script type="text/javascript">
        $(document).ready(function () {
            
            $("#btn_guardar").on("click", function () {
                alert('....');
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
                        }
                        alert('Registro modificado correctamente');
                    }

                });
            });

        });

</script>
</asp:Content>
