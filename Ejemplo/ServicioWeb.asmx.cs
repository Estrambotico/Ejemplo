using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Web.Mvc;
using Ejemplo.Models.Repositorios;
using Ejemplo.Models;
using System.Web.Helpers;
using RazorPDF;

namespace Ejemplo
{
    /// <summary>
    /// Descripción breve de ServicioWeb
    /// </summary>
    [WebService(Namespace = "http://localhost/ServicioWeb")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class ServicioWeb : System.Web.Services.WebService
    {
        RepoDenfensoria repo = new RepoDenfensoria();
        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }
        [WebMethod]
        public string edad(string edad){
            return "Mi edad es:"+edad;
        }

        [WebMethod]
        public JsonResult ListaEtapas()
        {
            IQueryable<Ca_AccionesProcesales> Etapas = repo.ListaEtapas();
            SelectList ls = new SelectList(Etapas, "Id_Etapa_Procesal", "Descripcion");
            return new JsonResult { Data = ls };
        }
        [WebMethod]
        public JsonResult ListaSubetapas(int? Etapa)
        {
            IQueryable<Ca_AccionesProcesales> SubEtapa = repo.ListaSubEtapas(Etapa);
            SelectList ls = new SelectList(SubEtapa, "Id_SubEtapa_Procesal", "Descripcion");
            return new JsonResult { Data = ls };
        }
    }
}
