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
    
    public partial class vDe_Bitacora
    {
        public short Anio { get; set; }
        public int Id_Expediente { get; set; }
        public short Id_Consec { get; set; }
        public string accion { get; set; }
        public Nullable<byte> Id_Estatus { get; set; }
        public string numero_Expediente { get; set; }
        public string Usuario { get; set; }
        public System.DateTime fecha_Registro { get; set; }
        public string Descripcion { get; set; }
        public short Id_ClasificacionJuzgado { get; set; }
        public System.DateTime Fecha { get; set; }
        public Nullable<int> id_Usuario { get; set; }
        public string Comentario_Cierre_Expediente { get; set; }
        public Nullable<int> Id_Acusado { get; set; }
    }
}
