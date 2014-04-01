<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <script type="text/javascript">
     var asInitVals = new Array();
     $(document).ready(function () {
         $('#div_tabla').load('/Delitos/ListaDelitos');

         $("#Id_Clasificacion1").on("change", function () {
             ajaxJson("/Delitos/SelectGrupos/", { cla: $(this).val() }, "id_Grupo1", 0, callBackLlenarSelect);
             var cla = $("#Id_Clasificacion1").val();
            
             var url = "/Delitos/ListaDelitos/?" + "id_cla=" + cla;

             $('#div_tabla').load(url);


         });

         $("#id_Grupo1").on("change", function () {
             
             var cla = $("#Id_Clasificacion1").val();
             var grupo = $("#id_Grupo1").val();
            
             var url = "/Delitos/ListaDelitos/?" + "id_cla=" + cla+"&id_grupo="+grupo;

             $('#div_tabla').load(url);


         });
     });
     function filtrar() {
         var cla = $("#Id_Clasificacion1").val();
         var grupo = $("#id_Grupo1").val();

         if (grupo == 0) {
             var url = "/Delitos/ListaDelitos/?" + "id_cla=" + cla;

         }
         else {
             var url = "/Delitos/ListaDelitos/?" + "id_cla=" + cla + "&id_grupo=" + grupo;
         }

         
         console.log(cla);
         $.ajax({
             url: url,
             dataType: 'html',
             timeout: 5000, // 5 seconds
             success: function (html) {
                 $("#div_tabla").html(html);
             }
         });
     }

            </script>

<div class="container">

   
<h2>Lista de delitos</h2>
    <label>CLASIFICACIONES: </label>
    <% var etapas = ViewData["Cla"] as List<Ejemplo.Models.Ca_Delitos>;  %>
     <%: Html.DropDownList("Id_Clasificacion1", new SelectList(etapas, "Id_Clasificacion", "Descripcion"), "---Seleccione---")%>

    <label>GRUPOS:</label>
    <select id="id_Grupo1" name="id_Grupo1">
             <option value="0">---Seleccione---</option>
      </select>
    <div id="div_tabla">

    </div>

 </div>
</asp:Content>
