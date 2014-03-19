<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Master/Master.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="jumbotron" style="background-color:white">
        <div class="container">
           <div class="row titulo ">
                <div class="col-md-12 letra_titulo">
                    <h2 >Tramites en Línea de Firma Electrónica</h2>
                   <p class="lead letra_titulo2">de Servicios del Gobierno del Estado</p>
               </div>
          </div>
         <div class="row titulo2 ">
               <div class="col-md-12 letra_titulo">
                   <h2>TRAMITE</h2>
               </div>
         </div>
          <div class="row">
             <div class="col-md-12">
                 <div class="div_select">
                <div class="btn-group btn-group-justified">
                  <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        Acta de Nacimiento<span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                      </ul>
                  </div>
                  
                </div>
            </div> 
             </div>
         </div>
            <div class="row">
                <div class="col-md-12 div_boton">
                   
                    <button type="button" class="boton_entar"> Entar&nbsp;&nbsp;&nbsp;<i class="fa fa-check-circle-o fa-1x"></i> </button>
                    <%: Html.ActionLink("Entrar", "ListaAcciones") %>
                </div>
            </div>
            <div class="row">
                <div id="div_img" class="col-md-6 col-lg-6 col-xs-1 ">
                    <asp:Image ID="Image2" CssClass="img-responsive" runat="server" ImageUrl="~/Content/Imagenes/volcanes.png" />
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12 div_derecha_con ">
                    <div class="div_derecha">
                        <i class="fa fa-hand-o-right fa-3x"></i><br />
                    <label>Obtención de Evidencias de Servicios del Gobierno del Estado </label>
                    </div>
                   
                    
                </div>
                
                
            </div>
            <div class="row footer">

                <div class="col-md-3">
                    <img src="http://www.colima-estado.gob.mx/cfg/imagenes/img/img_pie_escudogobierno.png" alt="gobierno del estado libre y soberano de colima" width="162" height="79" border="0">
                    <h6>Complejo Administrativo del Gobierno del Estado 3er anillo Periferico, Esq. Ejercito Mexicano S/N Colonia el Diezmo Tel
                        (312) 316 2000 CP 28010, Colima, Colima, Mexico
                    </h6>
                    
                    <img src="http://www.colima-estado.gob.mx/cfg/imagenes/ico/ico_separacion2.png" alt="Icon" width="199" height="2"> 
                </div>
                <div class="col-md-3">
                    <ul>Trámites y servicios
                        <ol>
                            <ul>Lista de trámites y servicios en linea</ul>
                            <ul>Catálogo de trámites y servicios</ul>
                        </ol>
                    </ul>
                   
                    
                    </div>
                <div class="col-md-3">
                   
                    <ul>
                         Gobierno
                        <ol>
                            <ul>Gabinete</ul>
                                <ul>
                                    Secretarías
                                </ul>
                                <ul>H. congreso del estado</ul>
                                <ul>
                                    Supremo tribunal de justicia
                            
                                </ul>
                                <ul>Periódico oficial

                                </ul>
                                <ul>
                                    Municipios
                                </ul>
                                <ul>
                                    Estructura orgánica
                                </ul>
                                <ul>
                                    Organismos desconcentrados, descentralizados y autónomos
                                </ul>
                            </ul>
                        </ol>
                    </ul>
                       
                   
                    <ul>
                        
                    </ul>
                                         
                   
                </div>
                <div class="col-md-3">
                    <h6>
                        Negocios<br />
                        Turismoa<br />
                        Cultura<br />
                        Seguridad<br />
                        Proteccion civil<br />

                    </h6>
                   
                </div>



            </div>

    </div>
      </div>


</asp:Content>
