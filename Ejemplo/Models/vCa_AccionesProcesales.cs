//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ejemplo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class vCa_AccionesProcesales
    {
        public short Id_Etapa_Procesal { get; set; }
        public byte Id_SubEtapa_Procesal { get; set; }
        public byte Id_Accion { get; set; }
        public string id_AccionProcesal { get; set; }
        public string Descripcion { get; set; }
        public string Etapa { get; set; }
        public string SubEtapa { get; set; }
        public Nullable<short> Usu_Act { get; set; }
        public string NombreCompleto { get; set; }
        public Nullable<System.DateTime> Fecha_Act { get; set; }
    }
}
