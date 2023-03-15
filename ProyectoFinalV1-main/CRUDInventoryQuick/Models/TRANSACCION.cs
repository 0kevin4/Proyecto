using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace CRUDInventoryQuick.Models
{
    [Table("TRANSACCION")]
    public partial class TRANSACCION
    {
        /// <summary>
        /// Identificador unico de la transaccion
        /// </summary>
        [Key]
        public int Id { get; set; }
       
        public int? IdProducto { get; set; }

        
        [Required(ErrorMessage = "Este campo no puede estar vacio")]
        [Column(TypeName = "date")]
        public DateTime Fecha { get; set; }

        [Required(ErrorMessage = "Este campo no puede estar vacio")]
        [StringLength(45)]
        public string TipoTransaccion { get; set; }

        [Required(ErrorMessage ="Este campo no puede estar vacio")]
        public int Cantidad { get; set; }

        [StringLength(45)]
        public string? Descripcion { get; set; }

        [Required(ErrorMessage ="Este campo no puede estar vacio")]
        [StringLength(125)]
        public string Usuario { get; set; }


    
        [ForeignKey("IdProducto")]
        [InverseProperty("TRANSACCIONs")]
        public virtual PRODUCTO? Producto { get; set; } = null!;

        
    }
}
