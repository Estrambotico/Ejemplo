using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ejemplo.Models.Repositorios;
using Ejemplo.Models;
using MvcRazorToPdf;
using DotNet.Highcharts;
using DotNet.Highcharts.Enums;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Options;
using Point = DotNet.Highcharts.Options.Point;
namespace Ejemplo.Controllers
{
    public class AccionesController : Controller
    {
        //
        // GET: /Acciones/
        RepoDenfensoria repo = new RepoDenfensoria();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Grafica()
        {
            Highcharts chart = new Highcharts("chart")
                 .InitChart(new Chart { DefaultSeriesType = ChartTypes.Line})
                 .SetTitle(new Title { Text = "Acciones procesales" })
                 .SetSubtitle(new Subtitle { Text = "" })
                 .SetXAxis(
                 new XAxis{
                     Categories = new[] { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" }
                 })
                 .SetYAxis(new YAxis { Title = new YAxisTitle { Text = "Cantidad" }, Labels = new YAxisLabels { Formatter = "function() { return Highcharts.numberFormat(this.value, 0);}" } })
                 .SetPlotOptions(new PlotOptions
                 {
                     Area = new PlotOptionsArea
                     {
                         PointStart = new PointStart(2004),
                         Marker = new PlotOptionsAreaMarker
                         {
                             Enabled = false,
                             Symbol = "circle",
                             Radius = 2,
                             States = new PlotOptionsAreaMarkerStates
                             {
                                 Hover = new PlotOptionsAreaMarkerStatesHover { Enabled = true }
                             }
                         }
                     }
                 })
                 .SetSeries(new []
                                { new Series { Name = "Colima", Data = new Data(new object[] { 5, 3, 4, 7, 2, 5, 8, 4,6,4,3,8}) },
                                  new Series { Name = "Jalisco", Data = new Data(new object[] { 2, 6, 9, 2, 1, 5, 8, 2,6,2,5,9 })} ,
                                  new Series { Name = "Michoacán", Data = new Data(new object[] { 2, 5, 23, 10, 4, 23, 4,1,4,2,8,7 })}
                                });

            return View(chart);
        }

        public ActionResult ListaAcciones(int? Etapa, int? SubEtapa)
        {
           // return new PdfActionResult("ListaAcciones2",repo.ListAccionesProcesales(Etapa, SubEtapa));
            return View(repo.ListAccionesProcesales(Etapa, SubEtapa));
        }

        public ActionResult PdfAcciones(int? Etapa, int? SubEtapa)
        {
            return new PdfActionResult("ListaAcciones2",repo.ListAccionesProcesales(Etapa, SubEtapa));
        }

        public ActionResult EditarAccion(String Id_Accion)
        {
            var etapas = repo.ListaEtapas().ToList();
            ViewData["etapas"] = etapas;
            Ca_AccionesProcesales accion = repo.ObtenerAccionProcesal(Id_Accion);
            return View(accion);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateAntiForgeryToken]
        public ActionResult EditarAccion(Ca_AccionesProcesales accion)
        {
            try
            {
                Ca_AccionesProcesales temp = repo.ObtenerAccionProcesal(accion.id_AccionProcesal);
                if (temp.Id_Etapa_Procesal != accion.Id_Etapa_Procesal && temp.Id_SubEtapa_Procesal != accion.Id_SubEtapa_Procesal)
                    UpdateModel<Ca_AccionesProcesales>(temp);
                else
                {
                    temp.Descripcion = accion.Descripcion;
                    temp.Usu_Act = 1;
                    temp.Fecha_Act = DateTime.Now;
                    repo.GuardarCambios();
                }
                return Json(new { Exito = true });
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message });
            }
        }

        public ActionResult NuevaAccionProcesal()
        {
            var etapas = repo.ListaEtapas().ToList();
            ViewData["etapas"] = etapas;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult NuevaAccionProcesal(Ca_AccionesProcesales accion, FormCollection form)
        {
            try
            {
                accion.Id_Accion = repo.NextAccion(accion.Id_Etapa_Procesal, accion.Id_SubEtapa_Procesal);
                accion.Fecha_Act = DateTime.Now;
                accion.Usu_Act = 1;
                repo.AgregarAccionProceal(accion);
                repo.GuardarCambios();
                return Json(new { Exito = true });
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message });
            }
        }

        public ActionResult EliminarAccion(String Id_Accion)
        {
            try
            {
                Ca_AccionesProcesales accion = repo.ObtenerAccionProcesal(Id_Accion);
                repo.EliminarAccion(accion);
                repo.GuardarCambios();
                return Json(new { Exito = true },JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult DetallesAccion(String Id_Accion)
        {
            return View(repo.ObtenerAccionProcesal(Id_Accion));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ListaEtapas()
        {
            IQueryable<Ca_AccionesProcesales> Etapas = repo.ListaEtapas();
            SelectList ls = new SelectList(Etapas, "Id_Etapa_Procesal", "Descripcion");
            return new JsonResult { Data = ls };
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ListaSubetapas(int? Etapa)
        {
            IQueryable<Ca_AccionesProcesales> SubEtapa = repo.ListaSubEtapas(Etapa);
            SelectList ls = new SelectList(SubEtapa, "Id_SubEtapa_Procesal", "Descripcion");
            return new JsonResult { Data = ls };
        }

        public ActionResult vista()
        {
            return View();
        }
    }
}
