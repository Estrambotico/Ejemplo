using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ejemplo.Models.Repositorios;
using Ejemplo.Models;
using System.Web.Helpers;

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
        public ActionResult ListaAcciones(int? Etapa, int? SubEtapa)
        {
            return View(repo.ListAccionesProcesales(Etapa, SubEtapa));
        }

        public ActionResult EditarAccion(String Id_Accion)
        {
            var etapas = repo.ListaEtapas().ToList();
            ViewData["etapas"] = etapas;
            Ca_AccionesProcesales accion = repo.ObtenerAccionProcesal(Id_Accion);
            return View(accion);
        }

        [AcceptVerbs(HttpVerbs.Post)]
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
