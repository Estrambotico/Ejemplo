using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Ejemplo.Models;

namespace Ejemplo.Models.Repositorios
{
    public class RepoDenfensoria
    {
        public BD_DefensoriaOficio_PruebasEntities db;
        public RepoDenfensoria()
        {
            db = new BD_DefensoriaOficio_PruebasEntities();
        }

        public IQueryable<Ca_AccionesProcesales> ListAccionesProcesales(int? Etapa, int? SubEtapa)
        {
            if(Etapa.HasValue && SubEtapa.HasValue)
            {
                return db.Ca_AccionesProcesales.Where(x => x.Id_Etapa_Procesal == Etapa.Value && x.Id_SubEtapa_Procesal == SubEtapa.Value && x.Id_Accion != 0);
            }
            else if (Etapa.HasValue && !SubEtapa.HasValue)
            {
                return db.Ca_AccionesProcesales.Where(x => x.Id_Etapa_Procesal == Etapa.Value && x.Id_Accion != 0);
            }
            else
            {
                return db.Ca_AccionesProcesales.Where(x => x.Id_Accion != 0);
            }
        }
        /*AQUI INICIA LA PARTE DE DELITOS */

        /* lista para obtener clasificacion*/
        public IQueryable<Ca_Delitos> ListaClasificacion() 
        {
            return db.Ca_Delitos.Where(x => x.Id_Delito == 0 && x.Id_Grupo == 0);
        }
        /*lista para obtener grupos*/
        public IQueryable<Ca_Delitos> ListaGrupos(int? cla)
        {
            if (cla.HasValue)
            {
                return db.Ca_Delitos.Where(x => x.Id_Clasificacion == cla && x.Id_Grupo != 0 && x.Id_Delito==0);
            }
            return db.Ca_Delitos.Where(x => x.Id_Delito == 0 && x.Id_Grupo!=0);
        
        }
        /*lista para obtener delitos*/
        public IQueryable<Ca_Delitos> ListaDelitos(int? cla, int? grupo)
        {
            if (cla.HasValue && grupo.HasValue)
            {
                return db.Ca_Delitos.Where(x => x.Id_Clasificacion == cla.Value && x.Id_Grupo == grupo.Value && x.Id_Delito != 0);
            }
            else if (cla.HasValue && !grupo.HasValue)
            {
                return db.Ca_Delitos.Where(x => x.Id_Clasificacion == cla.Value && x.Id_Delito != 0);
            }
            else
            {
                return db.Ca_Delitos.Where(x => x.Id_Delito != 0);
            }

        
        }

        /*Agregar un delito*/
        public void AgregarDelito(Ca_Delitos delito)
        {
            db.Ca_Delitos.Add(delito);
        }
        /*eliminar un delito*/
        public void EliminarDelito(Ca_Delitos delito)
        {
            db.Ca_Delitos.Remove(delito);
        }
        /*obtener delito*/
        public Ca_Delitos ObtenerDelito(string id_delito)
        {
            return db.Ca_Delitos.SingleOrDefault(x => x.Id_Delito2 == id_delito);
        }


        /*TERMINA LA PARTE DE DELITOS*/

        public IQueryable<Ca_AccionesProcesales> ListaEtapas()
        {
            return db.Ca_AccionesProcesales.Where(x => x.Id_Accion == 0 && x.Id_SubEtapa_Procesal == 0);
        }

        public IQueryable<Ca_AccionesProcesales> ListaSubEtapas(int? Etapa)
        {
            if (Etapa.HasValue)
            {
                return db.Ca_AccionesProcesales.Where(x => x.Id_Etapa_Procesal == Etapa && x.Id_SubEtapa_Procesal != 0);
            }
            else
                return db.Ca_AccionesProcesales.Where(x => x.Id_Accion == 0 && x.Id_SubEtapa_Procesal != 0);
        }
        public void AgregarAccionProceal(Ca_AccionesProcesales accion)
        {
            db.Ca_AccionesProcesales.Add(accion);
        }

        public void EliminarAccion(Ca_AccionesProcesales accion)
        {
            db.Ca_AccionesProcesales.Remove(accion);
        }

        public Ca_AccionesProcesales ObtenerAccionProcesal(string id_accion)
        {
            return db.Ca_AccionesProcesales.SingleOrDefault(x => x.id_AccionProcesal == id_accion);
        }

        public void GuardarCambios()
        {
            db.SaveChanges();
        }

        public byte NextAccion(Int16 Etapa, byte SubEtapa)
        {
            Int16 max = 0;
            try
            {
                max = (from reg in db.Ca_AccionesProcesales where reg.Id_Etapa_Procesal == Etapa && reg.Id_SubEtapa_Procesal == SubEtapa select reg.Id_Accion).Max();
            }
            catch
            {
                max = 0;
            }
            max++;
            return (byte)max;
        }

        public byte NextClasi() {
            Int16 max = 0;
            try
            {
                max = (from reg in db.Ca_Delitos select reg.Id_Clasificacion).Max();
            }
            catch {
                max = 0;
            }
            max++;
            return (byte)max;
        }
        public byte NextGrupo(Int16 id_cla)
        {
            Int16 max = 0;
            try
            {
                max = (from reg in db.Ca_Delitos where reg.Id_Clasificacion==id_cla select reg.Id_Grupo).Max();
            }
            catch
            {
                max = 0;
            }
            max++;
            return (byte)max;
        }
        public byte NextDelito(Int16 id_cla, Int16 id_grupo)
        {
            Int16 max = 0;
            try
            {
                max = (from reg in db.Ca_Delitos where reg.Id_Clasificacion==id_cla && reg.Id_Grupo==id_grupo select reg.Id_Delito).Max();
            }
            catch
            {
                max = 0;
            }
            max++;
            return (byte)max;
        }
    }
}