using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Ejemplo.Models.Repositorios
{
    public class RepoDomicilios
    {
        public BD_DefensoriaOficio_PruebasEntities db;//Contexto de la base de datos
        public RepoDomicilios() {
            db = new BD_DefensoriaOficio_PruebasEntities();
        }

        public Ca_Domicilios getDomicilio(int idDomicilio)
        {
            return db.Ca_Domicilios.SingleOrDefault(x => x.id_Domicilio == idDomicilio);
        }

        public void guardarCambios(){
            db.SaveChanges();
        }

        public int NextDomicilio()
        {
            int max = 0;
            try
            {
                max = (from reg in db.Ca_Domicilios select reg.id_Domicilio).Max();
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