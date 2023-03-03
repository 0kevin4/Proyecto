﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace CRUDInventoryQuick.Models
{
    [Table("PRODUCTO")]
    public partial class PRODUCTO
    {
        public PRODUCTO()
        {
            DETALLEPEDIDOs = new HashSet<DETALLEPEDIDO>();
            IMAGENPRODUCTOs = new HashSet<IMAGENPRODUCTO>();
            PRECIOs = new HashSet<PRECIO>();
            STOCKs = new HashSet<STOCK>();
            TRANSACCIONs = new HashSet<TRANSACCION>();
            UNIDADMEDIDa = new HashSet<UNIDADMEDIDum>();
        }


        [Key]
        public int ProductoId { get; set; }

        [Required(ErrorMessage = "El campo Nombre no puede estar vacio")]
        [StringLength(64)]
        public string Nombre { get; set; } = null!;

        [Required(ErrorMessage = "El campo Descripcion no puede estar vacio")]
        [StringLength(64)]
        public string Descripcion { get; set; } = null!;

        [Required(ErrorMessage = "El campo Cantidad no puede estar vacio")]
        public int Cantidad { get; set; }

        [Required(ErrorMessage = "El campo stockMinimo no puede estar vacio")]
        public int stockMinimo { get; set; }

        [Required(ErrorMessage = "El campo stockMaximo no puede estar vacio")]
        public int stockMaximo { get; set; }

        public bool Estado { get; set; }

        public int? SUBCATEGORIA_SubcategoriaId { get; set; }

        public int? MARCA_MarcaId { get; set; }

        [ForeignKey("MARCA_MarcaId")]
        [InverseProperty("PRODUCTOs")]
        public virtual MARCA? Marca{ get; set; } = null;
        [ForeignKey("SUBCATEGORIA_SubcategoriaId")]
        [InverseProperty("PRODUCTOs")]
        public virtual SUBCATEGORIum? Subcategoria { get; set; } = null;
        [InverseProperty("PRODUCTO_Producto")]
        public virtual ICollection<DETALLEPEDIDO> DETALLEPEDIDOs { get; set; }
        [InverseProperty("PRODUCTO_Producto")]
        public virtual ICollection<IMAGENPRODUCTO> IMAGENPRODUCTOs { get; set; }
        [InverseProperty("Producto")]
        public virtual ICollection<PRECIO> PRECIOs { get; set; }
        [InverseProperty("PRODUCTO_Producto")]
        public virtual ICollection<STOCK> STOCKs { get; set; }
        [InverseProperty("PRODUCTO_Producto")]
        public virtual ICollection<TRANSACCION> TRANSACCIONs { get; set; }
        [InverseProperty("PRODUCTO_Producto")]
        public virtual ICollection<UNIDADMEDIDum> UNIDADMEDIDa { get; set; }


        public void stockMax(int cantidadA)
        {
            this.Cantidad += cantidadA;
        }  

        public void stockMim(int cantidadE)
        {

            if (this.Cantidad < cantidadE)
            {
                this.Cantidad -= cantidadE;
            }
        }

        public bool InferiorStockMin()
        {
            return this.Cantidad < this.stockMinimo;
        }

        public bool SuperiorStockMax()
        {
            return this.Cantidad > this.stockMaximo;
        }
    }
}
