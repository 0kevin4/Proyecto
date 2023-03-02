using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CRUDInventoryQuick.Models
{
    [Table("PRECIO")]
    public partial class PRECIO
    {
        /// <summary>
        /// Identificador unico del precio
        /// </summary>
        [Key]
        public int PrecioId { get; set; }
        /// <summary>
        /// Indica la fecha ingreso del precio
        /// </summary>
        //[BindProperty, DataType(DataType.Date)]
        [Required(ErrorMessage ="El campo Fecha de Ingreso no puede estar vacio")]
        [Column(TypeName = "datetime")]
        public DateTime FechaIngreso { get; set; }
        /// <summary>
        /// Indica el precio compra del producto
        /// </summary>
        [Required(ErrorMessage = "El campo Precio de Compra no puede estar vacio")]
        [Column(TypeName = "decimal(10,0)")]
        public decimal PrecioCompra { get; set; }
        /// <summary>
        /// Indica un posible descuento que el producto pueda poseer
        /// </summary>
        [Required(ErrorMessage = "El campo Descuento no puede estar vacio")]
        [Column(TypeName = "decimal(10,0)")]
        public decimal Descuento { get; set; }
        /// <summary>
        /// Indica el precio venta incial 
        /// </summary>
        [Required(ErrorMessage = "El campo Precio Venta Inicial no puede estar vacio")]
        [Column(TypeName = "decimal(10,0)")]
        public decimal PrecioVentaInicial { get; set; }
        /// <summary>
        /// Indica el precio venta final
        /// </summary>
        [Required(ErrorMessage = "El campo Precio venta Final no puede estar vacio")]
        [Column(TypeName = "decimal(10,0)")]
        public decimal PrecioVentaFinal { get; set; }
        /// <summary>
        /// Identificador unico del producto
        /// </summary>
        public int? PRODUCTO_ProductoId { get; set; }

        [ForeignKey("PRODUCTO_ProductoId")]
        [InverseProperty("PRECIOs")]
        public virtual PRODUCTO? Producto { get; set; } = null!;
    }
}
