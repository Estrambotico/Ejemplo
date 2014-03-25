<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<Ejemplo.Models.Ca_AccionesProcesales>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Accion procesal</title>
    <link href="../../Content/css/bootstrap.min.css" rel="stylesheet" />
<link href="../../Content/css/bootstrap.css" rel="stylesheet" />
      <link href="../../Content/css/Estilo.css" rel="stylesheet" />
      <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
      <link href="../../Content/css/Estilo_responsive.css" rel="stylesheet" />
</head>
<body>
    <div class="container" style="width:600px">
        <div class="row starter-template titulo">
            <div class="col-md-12 letra_titulo">
                <h2>Accion procesal</h2>
            </div>
        </div>
    <fieldset>
        <legend>Detalles accion</legend>
    
           
        <div class="display-field">
            <%: Html.HiddenFor(model => model.Id_SubEtapa_Procesal) %>
        </div>
    
        <div class="display-field">
            <%: Html.HiddenFor(model => model.Id_Accion) %>
        </div>
    
        
        <div class="display-field">
            <%: Html.HiddenFor(model => model.id_AccionProcesal) %>
        </div>
    
        <div class="display-label">
           <label>Descripcion: </label> <%: Html.DisplayFor(model => model.Descripcion) %>
        </div>
        <div class="display-field">
           
           
        </div>
    
        
        <div class="display-field">
            <%: Html.HiddenFor(model => model.Usu_Act) %>
        </div>
    
        <div class="display-label">
           <label>Fecha de actualizacion: </label> <%: Html.DisplayFor(model => model.Fecha_Act) %>
        </div>
       
        
    </fieldset>
    </div>
</body>
</html>
