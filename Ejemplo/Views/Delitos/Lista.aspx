<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script type="text/javascript">
         var asInitVals = new Array();
         $(document).ready(function () {
             $.ajax({
                 url: "/Delitos/ListaGrupos",
                 dataType: 'html',
                 timeout: 5000, // 5 seconds
                 success: function (html) {
                     $("#div_tabla").html(html);
                 }
             });

             $("#Id_Clasificacion1").on("change", function () {
                 var cla = $("#Id_Clasificacion1").val();
                 
                 var url = "/Delitos/ListaGrupos/?" + "cla=" + cla;
                 $.ajax({
                     url:url,
                     dataType: 'html',
                     timeout: 5000, // 5 seconds
                     success: function (html) {
                         $("#div_tabla").html(html);
                     }
                 });
                             

             });
             $(".ajax").colorbox({ width: 500, height: 400 });
            
         });
         function filtrar() {
             var cla = $("#Id_Clasificacion1").val();
             if (cla < 1) {

                 var url = "/Delitos/ListaGrupos/";
             }
             else {
                 var url = "/Delitos/ListaGrupos/?" + "cla=" + cla;
             }
             
             
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




   
<h2>Lista de grupos</h2>
    <label>CLASIFICACIONES: </label>
    <% var etapas = ViewData["Cla"] as List<Ejemplo.Models.Ca_Delitos>;  %>
     <%: Html.DropDownList("Id_Clasificacion1", new SelectList(etapas, "Id_Clasificacion", "Descripcion"), "---Seleccione---", new{ @class="selectpicker" })%>


    <div id="div_tabla">

    </div>

   </div>

</asp:Content>
