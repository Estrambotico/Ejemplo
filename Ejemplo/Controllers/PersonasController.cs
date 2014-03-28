using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ejemplo.Models;
using Ejemplo.Models.Repositorios;
using WsCurp;
namespace Ejemplo.Controllers
{
    public class PersonasController : Controller
    {
        RepoPersonas repo = new RepoPersonas();
        RepoDomicilios repoDomicilio = new RepoDomicilios();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Nueva() {
            var listaPersonas = repo.getListaPersonas();
            return View(listaPersonas);
        }

        public ActionResult VerDatos(int id_persona)
        {
            ca_Personas persona = repo.db.ca_Personas.SingleOrDefault(x => x.Id_Persona == id_persona);
            return View(persona);
        }

        public ActionResult Eliminar(int id_persona)
        {
            ca_Personas persona = repo.db.ca_Personas.SingleOrDefault(x => x.Id_Persona == id_persona);
            try
            {
                repo.EliminarPersona(persona);
                repo.guardarCambios();
                return Json(new { Exito = true },JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult getCurpByNombre(String nombre, String apellido_p, String apellido_m, String estado, String fechaNac, String sexo)
        {
            WsCurp.ConsumeWsCurp Servicio = new WsCurp.ConsumeWsCurp();
            WsCurp.JsonCurp InfoPersona = Servicio.getCURP(nombre, apellido_p, apellido_m, estado, fechaNac, sexo);
            return Json(new
            {
                CURP = InfoPersona.CURP,
                NOMBRE = InfoPersona.Nombre,
                APELLIDO_P = InfoPersona.Apellido1,
                APELLIDO_M = InfoPersona.Apellido2,
                Exito = true
            }, JsonRequestBehavior.AllowGet);
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult Nueva(ca_Personas persona,Ca_Domicilios domicilio, FormCollection form)
        {
            try
            {
                if (persona.Nacionalidad ==true)
                {
                    domicilio.id_Domicilio = repoDomicilio.NextDomicilio();
                    domicilio.fecha_Registro = DateTime.Now;
                    domicilio.Fecha_Act = DateTime.Now;
                    persona.Usu_Act = 1;
                    repo.db.Ca_Domicilios.Add(domicilio);
                    repo.guardarCambios();
                    int id = domicilio.id_Domicilio;
                    persona.id_Domicilio = id;
                    persona.fecha_Registro = DateTime.Now;
                    persona.Fecha_Act = DateTime.Now;
                    persona.Id_Persona = repo.NextPersona();
                    repo.db.ca_Personas.Add(persona);
                    repo.guardarCambios();
                }
                else 
                {
                    persona.id_Domicilio = 0;
                    persona.fecha_Registro = DateTime.Now;
                    persona.Fecha_Act = DateTime.Now;
                    persona.Id_Persona = repo.NextPersona();
                    repo.db.ca_Personas.Add(persona);
                    repo.guardarCambios();
                }
                
                return Json(new { Exito = true });
            }
            catch (Exception ex)
            {
                return Json(new { Exito = false, Mensaje = ex.Message });
            }
        }

        public ActionResult dialogo_persona() {
            return View();            
        }
        
        public ActionResult GetDatosCURP(String Curp)
        {
            WsCurp.ConsumeWsCurp Servicio = new WsCurp.ConsumeWsCurp();
            WsCurp.JsonCurp InfoPersona = Servicio.getInfo(Curp.ToUpper());
            return Json(new
                {
                    Nombre = InfoPersona.Nombre,
                    Apellido_Paterno = InfoPersona.Apellido1,
                    Apellido_Materno = InfoPersona.Apellido2,
                    Nacionalidad = InfoPersona.Nacionalidad,
                    Exito = true
                },JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetEntidades()
        {
            ServiceConsumer servicio = new ServiceConsumer();
            List<ENTIDADES> lista = servicio.ListaEntidades();
            SelectList ls = new SelectList(lista, "CLAVE", "ENTIDAD");
            return new JsonResult { Data = ls };
        }

        public ActionResult GetMunicipios(String idEntidad) 
        {
            ServiceConsumer servicio = new ServiceConsumer();
            List<MUNICIPIOS> lista = servicio.ListaMunicipios(idEntidad);
            SelectList ls = new SelectList(lista, "CLAVE_MUNICIPIO", "MUNICIPIO");
            return new JsonResult { Data = ls };
        }

        public ActionResult GetLocalidades(string cveMunicipio)
        {
            ServiceConsumer servicio = new ServiceConsumer();
            List<LOCALIDADES> lista = servicio.ListaLocalidades(cveMunicipio);
            SelectList ls = new SelectList(lista, "CVE_LOCALIDAD", "LOCALIDAD");
            return new JsonResult { Data = ls };
        }

        public ActionResult GetColonias(String cveLocalidad)
        {
            ServiceConsumer servicio = new ServiceConsumer();
            List<COLONIAS> lista = servicio.ListaColonias(cveLocalidad);
            SelectList ls = new SelectList(lista, "CVE_COLONIA", "NOMBRE_COLONIA");
            return new JsonResult { Data = ls };
        }
    }
}
