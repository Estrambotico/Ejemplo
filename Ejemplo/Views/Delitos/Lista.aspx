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
             var tabla = $('#tableOne').dataTable({

                 "sPaginationType": "full_numbers",


                 "oLanguage": {
                     "oPaginate": {
                         "sPrevious": "Anterior",
                         "sNext": "Siguiente",
                         "sLast": "Ultima",
                         "sFirst": "Primera"
                     },

                     "sLengthMenu": 'Mostrar <select>' +
                     '<option value="5">5</option>' +
                     '<option value="10">10</option>' +
                     '<option value="20">20</option>' +
                     '<option value="30">30</option>' +
                     '<option value="40">40</option>' +
                     '<option value="50">50</option>' +
                     '<option value="-1">Todos</option>' +
                     '</select> registros',

                     "sInfo": "Mostrando del _START_ a _END_ (Total: _TOTAL_ resultados)",

                     "sInfoFiltered": " - filtrados de _MAX_ registros",

                     "sInfoEmpty": "No hay resultados de búsqueda",

                     "sZeroRecords": "No hay registros a mostrar",

                     "sProcessing": "Espere, por favor...",

                     "sSearch": "Buscar:",

                 }
             });
             $("tfoot input").keyup(function () {
                 /* Filter on the column (the index) of this element */
                 tabla.fnFilter(this.value, $("tfoot input").index(this));
             });



             /*
              * Support functions to provide a little bit of 'user friendlyness' to the textboxes in 
              * the footer
              */
             $("tfoot input").each(function (i) {
                 asInitVals[i] = this.value;
             });

             $("tfoot input").focus(function () {
                 if (this.className == "search_init") {
                     this.className = "";
                     this.value = "";
                 }
             });

             $("tfoot input").blur(function (i) {
                 if (this.value == "") {
                     this.className = "search_init";
                     this.value = asInitVals[$("tfoot input").index(this)];
                 }
             });

             $(".eliminar").on("click", function (e) {

                 e.preventDefault();
                 var eliminar = this;
                 console.log($(this).parent().get(0));
                 var url = $(this).attr('href');
                 var aPos = tabla.fnGetPosition($(this).parent().get(0));
                 console.log(aPos);
                 if (confirm('¿Seguro que desea eliminar?')) {
                     var url = $(this).attr('href');
                     $.ajax({
                         type: "GET",
                         datatype: "json",
                         url: url,

                         success: function (result) {
                             if (result.Exito == true) {
                                 tabla.fnDeleteRow(aPos[0]);
                                 alert('Registro elimado correctamente');
                                 var t = $("#tableOne").dataTable();

                             }
                             else {
                                 alert("'Error" + Mensaje + "'");


                             }

                         }

                     });

                 }
                 else {
                     return false;
                 }



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
