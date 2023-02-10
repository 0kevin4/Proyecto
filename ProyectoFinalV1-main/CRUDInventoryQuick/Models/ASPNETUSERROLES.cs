﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CRUDInventoryQuick.Models
{
    [Table("ASPNETUSERROLES")]
    public partial class ASPNETUSERROLES
    {

        /// <summary>
        /// Identificador unico de Rol
        /// </summary>
        [Key]
        public int Id { get; set; }
        /// <summary>
        /// Indica el nombre del rol correspondiente
        /// </summary>
        [Key]
        public int RolId { get; set; }
        [StringLength(225)]
        [Key]
        public string UsuarioId { get; set; }

        [ForeignKey("UsuarioId")]
        [InverseProperty("ASPNETUSERROLEs")]
        public virtual ASPNETUSERS? ASPNETUSER_ASPNETUSER { get; set; } = null!;

        [ForeignKey("RolId")]
        [InverseProperty("ASPNETUSERROLEs")]
        public virtual ASPNETROLES? ASPNETROLES_ASPNETROLES { get; set; } = null!;
    }
}
