<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_AccionesProcesales>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contenido" runat="server">
  
    <div class="row">
				<div class="pedazo_verde row col-md-1 col-sm-1 col-xs-3">&nbsp;</div>	
				<div class="pedazo_naranja row col-md-2 col-sm-4 col-xs-4">
					<label class="paso_1">NUEVA</label>
					<label class="paso_1_1">acción procesal</label>
					<div class="triangulo hidden-xs">&nbsp;</div>
				</div>
				<div class="pedazo_verde row col-md-9 col-sm-7 col-xs-5">&nbsp;</div>
			</div>
			<div class="clearfix">
				&nbsp;
			</div>
			<div class="alert alert-personalizado">
				<i class="fa fa-warning fa-2x amarillo">&nbsp;</i><label class="fuente_roja">Nota:</label> Se requiere que la información proporcionada sea correcta para poder porporcionar un servicio de calidad
			</div>
            <div class="row">
				<div class="col-lg-6 col-md-5 col-sm-6 col-xs-0">&nbsp;</div>				
				<div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
					<a href="#" class="btn btn-success_modificado"><i class="fa fa-cloud-download alineacion_centrada">&nbsp;Descargar manual</i></a>
					<a href="#" class="btn btn-success_modificado"><i class="fa fa-envelope alineacion_centrada">&nbsp;Cont&aacute;ctanos&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
				</div>
				<div class="col-lg-2 col-md-1 col-sm-0 col-xs-0">&nbsp;</div>
				<div class="col-lg-2 col-md-1 col-sm-0 col-xs-0">&nbsp;</div>
			</div>
			<br/>
			<div class="row">
				<form class="form-horizontal" action="" method="post">
					<div class="form-group">
						<label class="col-lg-4 col-md-3 col-sm-4 col-xs-6 control-label text-right">Etapa procesal:</label>
						<div class="col-lg-8 col-md-9 col-sm-8 col-xs-6">
                            <% var etapas = ViewData["etapas"] as List<Ejemplo.Models.Ca_AccionesProcesales>;  %>
                            <%: Html.DropDownList("Id_Etapa_Procesal",new SelectList(etapas,"Id_Etapa_Procesal","Descripcion"),"Seleccione","required") %>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 col-md-3 col-sm-4 col-xs-6 text-right control-label">Sub etapa procesal:</label>
						<div class="col-lg-8 col-md-9 col-sm-8 col-xs-6">
                            <select id="Id_SubEtapa_Procesal" name="Id_SubEtapa_Procesal"  required>
                                <option value="0">Seleccione...</option>
                            </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 col-md-3 col-sm-4 col-xs-6 text-right">Clave acción:</label>
						<div class="col-lg-8 col-md-9 col-sm-8 col-xs-6">
							<%: Html.EditorFor(model => model.Id_Accion) %>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 col-md-3 col-sm-4 col-xs-6 control-label text-right">Clave acción procesal:</label>
						<div class="col-lg-8 col-md-9 col-sm-8 col-xs-6">
							<%: Html.EditorFor(model => model.id_AccionProcesal) %>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 col-md-3 col-sm-4 col-xs-6 text-right control-label">Descripción:</label>
						<div class="col-lg-8 col-md-9 col-sm-8 col-xs-6">
							<%: Html.EditorFor(model => model.Descripcion) %>
						</div>
					</div>
                    <div class="form-group">
						<label class="col-lg-4 col-md-3 col-sm-4 col-xs-6 text-right control-label">¿Usuario activo?:</label>
						<div class="col-lg-8 col-md-9 col-sm-8 col-xs-6">
							<%: Html.EditorFor(model => model.Usu_Act) %>
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 col-md-3 col-sm-4 col-xs-6 text-right control-label">&nbsp;</label>
						<div class="col-lg-8 col-md-9 col-sm-8 col-xs-6">
							<button id="mostrarActa" name="mostrarActa" class="btn btn-primary btn-margin">Mostrar acta</button>
							<button id="siguiente" name="siguiente" class="btn btn-primary">Siguiente&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
						</div>
					</div>
				</form>
			</div>
<div>
    <%: Html.ActionLink("Volver al inicio", "Index") %>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#Id_Etapa_Procesal").on("change", function () {
            ajaxJson("/Acciones/ListaSubEtapas/", {"Etapa" : $(this).val()}, "#Id_SubEtapa_Procesal", 0, "callBackLlenarSelect");
        });
    });
    
</script>
</asp:Content>
