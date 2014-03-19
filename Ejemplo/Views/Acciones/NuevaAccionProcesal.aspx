<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.vCa_AccionesProcesales>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <div class="row starter-template titulo">
            <div class="col-md-12 letra_titulo">
                <h2>Nueva accion procesal</h2>
            </div>
        </div>

               

            <% using (Html.BeginForm()) { %>
                <%: Html.ValidationSummary(true) %>

                <fieldset>
                    

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Id_Etapa_Procesal) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Id_Etapa_Procesal) %>
                        <%: Html.ValidationMessageFor(model => model.Id_Etapa_Procesal) %>
                    </div>

                    <div class="editor-label">
                        <%: Html.LabelFor(model => model.Id_SubEtapa_Procesal) %>
                    </div>
                    <div class="editor-field">
                        <%: Html.EditorFor(model => model.Id_SubEtapa_Procesal) %>
                        <%: Html.ValidationMessageFor(model => model.Id_SubEtapa_Procesal) %>
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
                <%: Html.ActionLink("Regresar a la lista", "Index") %>
            </div>
  </div>

</asp:Content>
