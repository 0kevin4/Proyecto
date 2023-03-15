using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using CRUDInventoryQuick.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;

namespace CRUDInventoryQuick.Datos
{
    public partial class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext()
        {
        }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ASPNETUSERS> ASPNETUSERs { get; set; } = null!;
        public virtual DbSet<ASPNETUSERCLAIMS> ASPNETUSERCLAIMs { get; set; } = null!;
        public virtual DbSet<ASPNETUSERLOGINS> ASPNETUSERLOGINs { get; set; } = null!;
        public virtual DbSet<ASPNETROLES> ASPNETROLEs { get; set; } = null!;
        public virtual DbSet<ASPNETUSERROLES> ASPNETUSERROLEs { get; set; } = null!;
        public virtual DbSet<CATEGORIum> CATEGORIAs { get; set; } = null!;
        public virtual DbSet<MARCA> MARCAs { get; set; } = null!;
        public virtual DbSet<PRECIO> PRECIOs { get; set; } = null!;
        public virtual DbSet<PRODUCTO> PRODUCTOs { get; set; } = null!;
        public virtual DbSet<SUBCATEGORIum> SUBCATEGORIAs { get; set; } = null!; 
        public virtual DbSet<TRANSACCION> TRANSACCIONs { get; set; } = null!;


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=DESKTOP-8Q0854J;Database=Inventario;User ID=sa;Password=yenersito20");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            
            modelBuilder.Entity<ASPNETUSERS>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedOnAdd()
                    .HasComment("Identificador unico de usuario");

                entity.Property(e => e.NormalizedUserName).HasComment("Indica si el aceeso ha sido denegado");

                entity.Property(e => e.UserName).HasComment("Indica apellidos de la persona");

                entity.Property(e => e.PhoneNumber).HasComment("Indica la contraseña de usuario");

                entity.Property(e => e.Email).HasComment("Indica el correo del usuario");

                entity.Property(e => e.EmailConfirmed).HasComment("Indica si el correo ha sido confirmado");

                entity.Property(e => e.NormalizedEmail).HasComment("Indica dirección de usuario");

                entity.Property(e => e.PasswordHash)
                    .IsFixedLength()
                    .HasComment("Indica factores disponibles");

                entity.Property(e => e.ConcurrencyStamp).HasComment("Indica fecha abierta usuario");

                entity.Property(e => e.SecurityStamp).HasComment("Indica fecha cierre usuario");

                entity.Property(e => e.AccessFailedCount).HasComment("Indica fecha de nacimiento de usuario");

                entity.Property(e => e.LockoutEnabled).HasComment("Indica el nombre del usuario");

                entity.Property(e => e.LockoutEnd).HasComment("Indica nombre de la persona");

                entity.Property(e => e.PhoneNumberConfirmed).HasComment("Indica el reclamo de telefono usuario");

                entity.Property(e => e.TwoFactorEnabled).HasComment("Indica el sello de seguridad del usuario");

            });

            modelBuilder.Entity<ASPNETUSERCLAIMS>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico de llave");

                entity.Property(e => e.UserId).HasComment("Identificador unico de usuario");

                entity.Property(e => e.AspnetuserId).HasComment("Identificador unico del usuario");

                entity.Property(e => e.ClaimType).HasComment("Indica el tipo de llave");

                entity.Property(e => e.ClaimValue).HasComment("Indica el valor de la llave");

                entity.HasOne(d => d.ASPNETUSER_ASPNETUSER)
                    .WithMany(p => p.ASPNETUSERCLAIMs)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("ASPNETUSERCLAIM_ASPNETUSER_FK");
            });

            modelBuilder.Entity<ASPNETUSERLOGINS>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico de ingresar");

                entity.Property(e => e.UserId).HasComment("Identificador unico de usuario");

                entity.Property(e => e.LoginProvider).HasComment("Indica ingreso");

                entity.Property(e => e.ProviderKey).HasComment("Indica llave");

                entity.Property(e => e.ProviderDisplayName).HasComment("Nombre");

                entity.HasOne(d => d.ASPNETUSER_ASPNETUSER)
                    .WithMany(p => p.ASPNETUSERLOGINs)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("ASPNETUSERLOGIN_ASPNETUSER_FK");
            });

            modelBuilder.Entity<ASPNETUSERROLES>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .HasName("Identificador");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico de ingresar");

                entity.Property(e => e.UserId).HasComment("Identificador unico de usuario");

                entity.Property(e => e.RoleId).HasComment("Indentificar unico de Rol");

                entity.HasOne(d => d.ASPNETUSER_ASPNETUSER)
                    .WithMany(p => p.ASPNETUSERROLEs)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("ASPNETUSERROLES_ASPNETUSERS_FK");

                entity.HasOne(d => d.ASPNETROLES_ASPNETROLES)
                   .WithMany(p => p.ASPNETUSERROLEs)
                   .HasForeignKey(d => d.RoleId)
                   .OnDelete(DeleteBehavior.ClientSetNull)
                   .HasConstraintName("ASPNETUSERROLES_ASPNETROLES_FK");

            });

            modelBuilder.Entity<ASPNETROLES>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .HasName("ASPNETUSERROLE_PK");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico de Rol");

                entity.Property(e => e.Name).HasComment("Indica el nombre del rol correspondiente");
            });

            modelBuilder.Entity<CATEGORIum>(entity =>
            {
                entity.HasKey(e => e.CategoriaId)
                    .HasName("CATEGORIA_PK");

                entity.Property(e => e.CategoriaId)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico de categoria");

                entity.Property(e => e.Estado).HasComment("Indica si la categoria se encuentra activa");

                entity.Property(e => e.Nombre).HasComment("Indica el nombre de la categoria");
            });
            
            modelBuilder.Entity<MARCA>(entity =>
            {
                entity.Property(e => e.MarcaId)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico de marca");

                entity.Property(e => e.Estado).HasComment("Indica si la marca esta activa");

                entity.Property(e => e.Nombre).HasComment("Indica el nombre de la marca");
            });

            modelBuilder.Entity<PRECIO>(entity =>
            {
                entity.Property(e => e.PrecioId)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico del precio");

                entity.Property(e => e.Descuento).HasComment("Indica un posible descuento que el producto pueda poseer");

                entity.Property(e => e.FechaIngreso).HasComment("Indica la fecha ingreso del precio");

                entity.Property(e => e.PRODUCTO_ProductoId).HasComment("Identificador unico del producto");

                entity.Property(e => e.PrecioCompra).HasComment("Indica el precio compra del producto");

                entity.Property(e => e.PrecioVentaFinal).HasComment("Indica el precio venta final");

                entity.Property(e => e.PrecioVentaInicial).HasComment("Indica el precio venta incial ");

                entity.HasOne(d => d.Producto)
                    .WithMany(p => p.PRECIOs)
                    .HasForeignKey(d => d.PRODUCTO_ProductoId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("PRECIO_PRODUCTO_FK");
            });

            modelBuilder.Entity<PRODUCTO>(entity =>
            {
                entity.Property(e => e.ProductoId)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico del producto");

                entity.Property(e => e.Descripcion).HasComment("Indica las caracteristicas que posee el producto");

                entity.Property(e => e.Estado).HasComment("Indica si el producto esta activo");

                entity.Property(e => e.MARCA_MarcaId).HasComment("Identificador unico de la marca");

                entity.Property(e => e.Nombre).HasComment("Indica el nombre del producto");

                entity.Property(e => e.Cantidad).HasComment("Indica la cantidad del producto");

                entity.Property(e => e.stockMinimo).HasComment("Indica el stock Minimo");

                entity.Property(e => e.stockMaximo).HasComment("Indica el stock Maximo");


                entity.Property(e => e.SUBCATEGORIA_SubcategoriaId).HasComment("Identificador unico de la subcategoria");

                entity.HasOne(d => d.Marca)
                    .WithMany(p => p.PRODUCTOs)
                    .HasForeignKey(d => d.MARCA_MarcaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("PRODUCTO_MARCA_FK");

                entity.HasOne(d => d.Subcategoria)
                    .WithMany(p => p.PRODUCTOs)
                    .HasForeignKey(d => d.SUBCATEGORIA_SubcategoriaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("PRODUCTO_SUBCATEGORIA_FK");
            });

            modelBuilder.Entity<SUBCATEGORIum>(entity =>
            {
                entity.HasKey(e => e.SubcategoriaId)
                    .HasName("SUBCATEGORIA_PK");

                entity.Property(e => e.SubcategoriaId)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico de la subactegoria");

                entity.Property(e => e.CATEGORIA_CategoriaId).HasComment("Identificador unico de la categoria");

                entity.Property(e => e.Estado).HasComment("Indica si la categoria esta activa ");

                entity.Property(e => e.Nombre).HasComment("Indica el nombre de la categoria");

                entity.HasOne(d => d.Categoria)
                    .WithMany(p => p.SUBCATEGORIa)
                    .HasForeignKey(d => d.CATEGORIA_CategoriaId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("SUBCATEGORIA_CATEGORIA_FK");
            });

            modelBuilder.Entity<TRANSACCION>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .HasName("TRANSACCION_PK");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasComment("Identificador unico de la transaccion");

                entity.Property(e => e.IdProducto).HasComment("Llave foranea Transaccion_Producto");

                entity.Property(e => e.Fecha).HasComment("Fecha Correspondiente a la entrada o salida");

                entity.Property(e => e.TipoTransaccion).HasComment("Tipo de transaccion");

                entity.Property(e => e.Cantidad).HasComment("Cantidad de entrada o salida del producto");

                entity.HasOne(d => d.Producto)
                    .WithMany(p => p.TRANSACCIONs)
                    .HasForeignKey(d => d.IdProducto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("TRANSACCION_PRODUCTO_FK");
            });

            OnModelCreatingPartial(modelBuilder);
            base.OnModelCreating(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
