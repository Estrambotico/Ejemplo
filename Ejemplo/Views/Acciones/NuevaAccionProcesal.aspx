<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.vCa_AccionesProcesales>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <div class="row starter-template titulo">
            <div class="col-md-12 letra_titulo">
                <h2>Nueva accion procesal</h2>
            </div>
        </div>
        <div class="row">
            <div class="form-horizontal">
                <div class="form-group">

                </div>
            </div>
        </div>

               

            <% using (Html.BeginForm()) { %>
                <%: Html.ValidationSummary(true) %>

                <fieldset>
                    

                    <div class="editor-label">
                       <label class="control-label text-right">Etapa procesal</label>
                    </div>
                    <div class="editor-field">
                        <% var etapas = ViewData["Etapas"] as List<Ejemplo.Models.Ca_AccionesProcesales>;  %>
                            <%: Html.DropDownList("Id_Etapa_Procesal",new SelectList(etapas,"Id_Etapa_Procesal","Descripcion"),"---Seleccione---","required") %>
                    </div>

                    <div class="editor-label">
                         <label class="control-label text-right">SubEtapa procesal</label>
                    </div>
                    <div class="editor-field">
                        <select id="Id_SubEtapa_Procesal" name="Id_SubEtapa_Procesal">
                                <option value="0">---Seleccione---</option>
                            </select>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Id_Accion) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Id_Accion) %>
                        <%: Html.ValidationMessageFor(model => model.Id_Accion) %>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.id_AccionProcesal) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.id_AccionProcesal) %>
                        <%: Html.ValidationMessageFor(model => model.id_AccionProcesal) %>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Descripcion) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Descripcion) %>
                        <%: Html.ValidationMessageFor(model => model.Descripcion) %>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Etapa) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Etapa) %>
                        <%: Html.ValidationMessageFor(model => model.Etapa) %>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.SubEtapa) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.SubEtapa) %>
                        <%: Html.ValidationMessageFor(model => model.SubEtapa) %>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Usu_Act) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Usu_Act) %>
                        <%: Html.ValidationMessageFor(model => model.Usu_Act) %>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.NombreCompleto) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.NombreCompleto) %>
                        <%: Html.ValidationMessageFor(model => model.NombreCompleto) %>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Fecha_Act) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Fecha_Act) %>
                        <%: Html.ValidationMessageFor(model => model.Fecha_Act) %>
                    </div>

                    <p>
                        <button type="submit" class="btn btn-primary" >Guardar</button>
                       
                    </p>
                </fieldset>
            <% } %>

            <div>
                <%: Html.ActionLink("Regresar a la lista", "ListaAcciones") %>
            </div>
  </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Id_Etapa_Procesal").on("change", function () {
                ajaxJson("/Acciones/ListaSubEtapas/", { Etapa: $(this).val() }, "Id_SubEtapa_Procesal", 0, callBackLlenarSelect);
               
            });
           
        });

</script>
</asp:Content>
