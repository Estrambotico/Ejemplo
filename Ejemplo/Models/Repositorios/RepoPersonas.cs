using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ejemplo.Models.Repositorios
{
    public class RepoPersonas
    {
        public BD_DefensoriaOficio_PruebasEntities db;//Contexto de la base de datos
        public RepoPersonas() {
            db = new BD_DefensoriaOficio_PruebasEntities();
        }

        public void guardarCambios()
        {
            db.SaveChanges();
        }
        public void EliminarPersona(ca_Personas persona)
        {
            db.ca_Personas.Remove(persona);
        }
        public List<vCa_Personas> getListaPersonas() 
        {
            return db.vCa_Personas.Where(x => x.id_Domicilio != null && x.Domicilio !=null).OrderBy(x=>x.fecha_Registro).ToList();
        }
        
        public int NextPersona()
        {
            int max = 0;
            try
            {
                max = (from reg in db.ca_Personas select reg.Id_Persona).Max();
            }
            catch
            {
                max = 0;
            }
            max++;
            return max;
        }
    }
}