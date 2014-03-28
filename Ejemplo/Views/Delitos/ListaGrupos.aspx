<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Ejemplo.Models.Ca_Delitos>>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <link href="../../Content/DataTable/jquery.dataTables.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width" />
    <title>ListaGrupos</title>
</head>
<body>
   <table id="tableOne" class="display" width="100%" style="margin: 1% auto;">
    <thead>
        <tr>
        <th>
               Nueva<a href="/Delitos/NuevoGrupo" class="ajax fa fa-plus-square fa-2x">
                       </a>
        </th>
            <th>
                 
            </th>
            <th></th>
       
    </tr>
        <tr>
            <th>
                Descripcion
            </th>
            <th>
                Fecha de actualizacion
            </th>
            <th width="10%"></th>
        </tr>
    </thead>
    <tbody id="contenido">
        <% foreach (var item in Model) { %>
    <tr>
        
       
        <td>
            <%: Html.DisplayFor(modelItem => item.Descripcion) %>
        </td>
       
        
        <td>
            <%: Html.DisplayFor(modelItem => item.Fecha_Act) %>
        </td>
        <td width="10%">
             <%: Html.ActionLink(" ", "EditarGrupo", new {id_grupo=item.Id_Delito2}, new { @class="ajax fa fa-pencil-square-o" }) %> |
           
           <%: Html.ActionLink(" ", "DetallesGrupos", new {id_grupo=item.Id_Delito2}, new { @class="ajax fa fa-bars" }) %> |
           <%: Html.ActionLink(" ", "EliminarClasificacion", new { Id_Clasi = item.Id_Delito2 }, new { @class = "eliminar fa fa-trash-o" })%>
        </td>
    </tr>
<% } %>
    </tbody>
   



</table>


    <script type="text/javascript">
        var asInitVals = new Array();
        $(document).ready(function () {
            $("#Id_Clasificacion").on("change", function () {




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
                if (confirm('¿Seguro que desea eliminar?')) {
                    var url = $(this).attr('href');
                    $.ajax({
                        type: "GET",
                        datatype: "json",
                        url: url,

                        success: function (result) {
                            if (result.Exito == true) {
                                alert('Registro elimado correctamente');

                                window.open("/Delitos/Index", "_self");

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
</body>
</html>
