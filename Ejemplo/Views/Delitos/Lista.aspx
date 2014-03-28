<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_Delitos>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script type="text/javascript">
         var asInitVals = new Array();
         $(document).ready(function () {
             $('#div_tabla').load('/Delitos/ListaGrupos');

             $("#Id_Clasificacion1").on("change", function () {
                 var cla = $("#Id_Clasificacion1").val();
                 
                 var url = "/Delitos/ListaGrupos/?" + "cla=" + cla;

                 $('#div_tabla').load(url);
                             

              });
         });
      
         
         
         
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
