using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRUDInventoryQuick.Datos;
using CRUDInventoryQuick.Models;
using Twilio.TwiML.Voice;
using CRUDInventoryQuick.Contracts;
using CRUDInventoryQuick.Repositorio;
using Microsoft.AspNetCore.Identity;

namespace CRUDInventoryQuick.Controllers
{
    public class TransaccionController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IRepository<TRANSACCION> _TransaccionRepository;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IRepository<PRODUCTO> _ProductoRepository;
        private List<SelectListItem> _Producto;

        public TransaccionController(ApplicationDbContext context, IRepository<TRANSACCION> TransaccionRepository, IRepository<PRODUCTO> ProductoRepository, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _TransaccionRepository = TransaccionRepository;
            _ProductoRepository = ProductoRepository;
            _userManager = userManager;
        }

        // GET: Transaccion
        public async Task<IActionResult> Index()
        {
            return _TransaccionRepository.GetAll() != null ?
                        View(await _TransaccionRepository.GetAll()) :
                        Problem("Entity set 'ApplicationDbContext.PRODUCTOs'  is null.");
        }

        // GET: Transaccion/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _TransaccionRepository.GetAll() == null)
            {
                return NotFound();
            }

            var tRANSACCION = await _TransaccionRepository.GetById((int)id);
            if (tRANSACCION == null)
            {
                return NotFound();
            }

            return View(tRANSACCION);
        }

        // GET: Transaccion/Create
        public async Task<IActionResult> Create()
        {

            var products = await _ProductoRepository.GetAll();
            _Producto = new List<SelectListItem>();
            foreach (var product in products)
            {
                _Producto.Add(new SelectListItem
                {
                    Text = product.Nombre,
                    Value = product.ProductoId.ToString()
                });
            }
            ViewBag.Producto = _Producto;

            //Lista de Seleccion
            List<SelectListItem> opciones = new List<SelectListItem>()
            {
                new SelectListItem() { Text = "Entrada", Value = "Entrada" },
                new SelectListItem() { Text = "Salida", Value = "Salida" },
            };
            ViewBag.Opciones = opciones;
            
            return View();
        }

        // POST: Transaccion/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,IdProducto,Fecha,TipoTransaccion,Cantidad,Decripcion,Usuario")] TRANSACCION tRANSACCION)
        {
            if (ModelState.IsValid)
            {
                //Obtener Fecha Actual
                tRANSACCION.Fecha = DateTime.Now;

                //Obtener el usuario
                var usuarioActual = await _userManager.FindByNameAsync(User.Identity.Name);

                tRANSACCION.Usuario = usuarioActual.UserName;

                await _TransaccionRepository.Add(tRANSACCION);
                    
                //Restar o Sumar la cantidad, si es entrada o salida
                var producto = _context.PRODUCTOs.Find(tRANSACCION.IdProducto);

                if (tRANSACCION.TipoTransaccion == "Entrada")
                {
                    producto.Cantidad += tRANSACCION.Cantidad;
                }
                else if (tRANSACCION.TipoTransaccion == "Salida")
                {
                    producto.Cantidad -= tRANSACCION.Cantidad;


                    if (producto.Cantidad < 0)
                    {
                        TempData["Mensaje"] = "La cantidad del producto no puede ser inferior a 0. La cantidad actual de " + producto.Nombre + " es de " + producto.Cantidad + ".";
                        return RedirectToAction(nameof(Create));
                    }

                }
                _context.Entry(producto).State = EntityState.Modified;


                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }

            var products = await _ProductoRepository.GetAll();
            _Producto = new List<SelectListItem>();
            foreach (var product in products)
            {
                _Producto.Add(new SelectListItem
                {
                    Text = product.Nombre,
                    Value = product.ProductoId.ToString()
                });
            }
            ViewBag.Producto = _Producto;

            //Lista de Seleccion
            List<SelectListItem> opciones = new List<SelectListItem>()
            {
                new SelectListItem() { Text = "Entrada", Value = "Entrada" },
                new SelectListItem() { Text = "Salida", Value = "Salida" },
            };
            ViewBag.Opciones = opciones;

            return View(tRANSACCION);
        }

        // GET: Transaccion/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _TransaccionRepository.GetAll() == null)
            {
                return NotFound();
            }

            var tRANSACCION = await _TransaccionRepository.GetById((int)id);
            if (tRANSACCION == null)
            {
                return NotFound();
            }

            //Lista Productos
            var products = await _ProductoRepository.GetAll();
            _Producto = new List<SelectListItem>();
            foreach (var product in products)
            {
                _Producto.Add(new SelectListItem
                {
                    Text = product.Nombre,
                    Value = product.ProductoId.ToString()
                });
            }
            ViewBag.Producto = _Producto;

            //Lista de Seleccion
            List<SelectListItem> opciones = new List<SelectListItem>()
            {
                new SelectListItem() { Text = "Entrada", Value = "Entrada" },
                new SelectListItem() { Text = "Salida", Value = "Salida" },
            };
            ViewBag.Opciones = opciones;

            return View(tRANSACCION);
        }

        // POST: Transaccion/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,IdProducto,Fecha,TipoTransaccion,Cantidad,Descripcion,Usuario")] TRANSACCION tRANSACCION)
        {
            if (id != tRANSACCION.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                var result =  _context.TRANSACCIONs.Update(tRANSACCION);


                var producto = _context.PRODUCTOs.Find(tRANSACCION.IdProducto);

                if (tRANSACCION.TipoTransaccion == "Entrada")
                {
                    producto.Cantidad += tRANSACCION.Cantidad;
                }
                else if (tRANSACCION.TipoTransaccion == "Salida")
                {
                    producto.Cantidad -= tRANSACCION.Cantidad;


                    if (producto.Cantidad < 0)
                    {
                        TempData["Mensaje"] = "La cantidad del producto no puede ser inferior a 0. La cantidad actual de " + producto.Nombre + " es de " + producto.Cantidad + ".";
                        return RedirectToAction(nameof(Edit));
                    }

                }
                _context.Entry(producto).State = EntityState.Modified;


                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            //Lista Productos
            var products = await _ProductoRepository.GetAll();
            _Producto = new List<SelectListItem>();
            foreach (var product in products)
            {
                _Producto.Add(new SelectListItem
                {
                    Text = product.Nombre,
                    Value = product.ProductoId.ToString()
                });
            }
            ViewBag.Producto = _Producto;

            //Lista de Seleccion
            List<SelectListItem> opciones = new List<SelectListItem>()
                {
                    new SelectListItem() { Text = "Entrada", Value = "Entrada" },
                    new SelectListItem() { Text = "Salida", Value = "Salida" },
                };
            ViewBag.Opciones = opciones;

            return View(tRANSACCION);
        }

        // GET: Transaccion/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _TransaccionRepository.GetAll() == null)
            {
                return NotFound();
            }

            var tRANSACCION = await _TransaccionRepository.GetById((int)id);
            if (tRANSACCION == null)
            {
                return NotFound();
            }

            return View(tRANSACCION);
        }

        // POST: Transaccion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_TransaccionRepository.GetAll() == null)
            {
                return Problem("Entity set 'ApplicationDbContext.TRANSACCIONs'  is null.");
            }
            var tRANSACCION = await _TransaccionRepository.GetById(id);
            if (tRANSACCION != null)
            {
                await _TransaccionRepository.Delete(tRANSACCION);
            }

            await _TransaccionRepository.Save();
            return RedirectToAction(nameof(Index));
        }

        //private bool TRANSACCIONExists(int id)
        //{
        //  return _context.TRANSACCIONs.Any(e => e.Id == id);
        //}
    }
}
