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
    public class DelitosController : Controller
    {
        //
        // GET: /Delitos/
        RepoDenfensoria repo = new RepoDenfensoria();

        public ActionResult Index()
        {
            var clasi = repo.ListaClasificacion().ToList();
            ViewData["Cla"] = clasi;
            return View("Lista");
        }
        public ActionResult ListaClasificacion()
        {
            return View(repo.ListaClasificacion());

        }
        /*NUEVA CLASIFICACION*/
        public ActionResult NuevaClasificacion()
        {
            
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult NuevaClasificacion(Ca_Delitos delito, FormCollection form)
        {
            try
            {
                delito.Id_Clasificacion = repo.NextClasi();
                delito.Id_Grupo = 0;
                delito.Id_Delito = 0;
                delito.Gravedad = null;
                delito.Fecha_Act = DateTime.Now;
                delito.Usu_Act = 1;
                repo.AgregarDelito(delito);
            
                
                repo.GuardarCambios();
                return Json(new { Exito = true });
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message });
            }
        }

        /*EDITAR CLASIFICACION*/
        public ActionResult EditarClasificacion(String Id_Clasi)
        {
            Ca_Delitos delitos = repo.ObtenerDelito(Id_Clasi);

            return View(delitos);
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditarClasificacion(Ca_Delitos delito)
        {
            try
            {
                delito.Fecha_Act = DateTime.Now;
                Ca_Delitos temp = repo.ObtenerDelito(delito.Id_Delito2);

                temp.Fecha_Act = DateTime.Now;
                temp.Descripcion = delito.Descripcion;
                UpdateModel<Ca_Delitos>(temp);
                repo.GuardarCambios();
                
                return Json(new { Exito = true });
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message });
            }
        }
        /*DETALLES CLASIFICACION*/

        public ActionResult DetallesClasificacion(String Id_Clasi)
        {
            Ca_Delitos delitos = repo.ObtenerDelito(Id_Clasi);

            return View(delitos);
        }
        /*ELIMINAR CLASIFICACION*/
        public ActionResult EliminarClasificacion(String Id_Clasi)
        {
            try
            {
                Ca_Delitos delito = repo.ObtenerDelito(Id_Clasi);

                repo.EliminarDelito(delito);
                repo.GuardarCambios();
                return Json(new { Exito = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        /*LISTA DE GRUPOS */
        
        public ActionResult ListaGrupos(int? cla)
        {           

            return View(repo.ListaGrupos(cla));        
        }
       
        /*Obtener */
        /*NUEVO GRUPO*/
        public ActionResult NuevoGrupo() 
        {
            var cla = repo.ListaClasificacion().ToList();
            ViewData["Cla"] = cla;
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult NuevoGrupo(Ca_Delitos delito, FormCollection form)
        {
            try
            {

                delito.Id_Grupo = repo.NextGrupo(delito.Id_Clasificacion);
                delito.Id_Delito = 0;
                delito.Gravedad = null;
                delito.Fecha_Act = DateTime.Now;
                delito.Usu_Act = 1;
                repo.AgregarDelito(delito);


                repo.GuardarCambios();
                return Json(new { Exito = true });
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message });
            }
        }
        /*MODIFICAR GRUPO*/

        public ActionResult EditarGrupo(String id_grupo) {
            var cla = repo.ListaClasificacion().ToList();
            ViewData["Cla"] = cla;
            Ca_Delitos delitos = repo.ObtenerDelito(id_grupo);

            return View(delitos);

        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult EditarGrupo(Ca_Delitos delito)
        {
            try
            {
                delito.Fecha_Act = DateTime.Now;
                Ca_Delitos temp = repo.ObtenerDelito(delito.Id_Delito2);
               
                temp.Fecha_Act = DateTime.Now;
                temp.Descripcion = delito.Descripcion;
                UpdateModel<Ca_Delitos>(temp);
                repo.GuardarCambios();

                return Json(new { Exito = true });
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message });
            }
        }

        /*DETALLES GRUPOS*/
        public ActionResult DetallesGrupos(String id_grupo)
        {
            Ca_Delitos delitos = repo.ObtenerDelito(id_grupo);

            return View(delitos);
        }
        /*--------------------------------------------------------------------------*/
        /*LISTA DE DELITOS*/
        public ActionResult IndexDelitos() {
            var clasi = repo.ListaClasificacion().ToList();
            ViewData["Cla"] = clasi;
            return View();
        }
        public ActionResult ListaDelitos(int? id_cla, int? id_grupo)
        {
            return View(repo.ListaDelitos(id_cla,id_grupo));
 
        
        }
        /*NUEVO DELITO*/

        public ActionResult NuevoDelito() {
            var clasi = repo.ListaClasificacion().ToList();
            ViewData["Cla"] = clasi;
            return View();
        }
         [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult NuevoDelito(Ca_Delitos delito, FormCollection form)
        {
            try
            {
                
                delito.Id_Delito = repo.NextDelito(delito.Id_Clasificacion,delito.Id_Grupo);
                
                delito.Fecha_Act = DateTime.Now;
                delito.Usu_Act = 1;
                repo.AgregarDelito(delito);


                repo.GuardarCambios();
                return Json(new { Exito = true });
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message });
            }
        }
        /*EDITAR DELITOS*/
         public ActionResult EditarDelito(String id_grupo)
         {
             
             Ca_Delitos delitos = repo.ObtenerDelito(id_grupo);

             return View(delitos);

         }
         [AcceptVerbs(HttpVerbs.Post)]
         public ActionResult EditarDelito(Ca_Delitos delito)
         {
             try
             {
                 delito.Fecha_Act = DateTime.Now;
                 Ca_Delitos temp = repo.ObtenerDelito(delito.Id_Delito2);

                 temp.Fecha_Act = DateTime.Now;
                 temp.Descripcion = delito.Descripcion;
                 UpdateModel<Ca_Delitos>(temp);
                 repo.GuardarCambios();

                 return Json(new { Exito = true });
             }
             catch (Exception ex)
             {
                 return Json(new { Exito = false, Mensaje = ex.Message });
             }
         }
        /*DETALLES DELITO*/
         public ActionResult DetallesDelitos(String id_grupo)
         {
             Ca_Delitos delitos = repo.ObtenerDelito(id_grupo);

             return View(delitos);
         }



        /*SELECT DE GRUPOS*/

         [AcceptVerbs(HttpVerbs.Post)]
         public ActionResult SelectGrupos(int? cla)
         {
             IQueryable<Ca_Delitos> grupo = repo.ListaGrupos(cla);
             SelectList ls = new SelectList(grupo, "Id_Grupo", "Descripcion");
             return new JsonResult { Data = ls };
         }

        

    }
}
