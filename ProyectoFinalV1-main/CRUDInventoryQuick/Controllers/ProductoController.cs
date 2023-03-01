using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRUDInventoryQuick.Datos;
using CRUDInventoryQuick.Models;
using NuGet.Protocol.Core.Types;
using CRUDInventoryQuick.Contracts;
using Microsoft.AspNetCore.Authorization;
using SendGrid.Helpers.Mail;

namespace CRUDInventoryQuick.Controllers
{
    [Authorize]
    public class ProductoController : Controller
    {
        private readonly IRepository<PRODUCTO> _Productorepository;
        private readonly IRepository<SUBCATEGORIum> _subcategoriaRepository;
        private readonly IRepository<MARCA> _MarcaRepository;
        private readonly ApplicationDbContext _context;
        private List<SelectListItem> _Subcategoria;
        private List<SelectListItem> _Marca;
        public ProductoController(IRepository<PRODUCTO> Productorepository, IRepository<SUBCATEGORIum> subcategoriaRepository, IRepository<MARCA> MarcaRepository, ApplicationDbContext context)
        {
            _Productorepository = Productorepository;
            _subcategoriaRepository = subcategoriaRepository;
            _MarcaRepository = MarcaRepository;
            _context = context;
        }

        //GET: Producto
        public async Task<IActionResult> Index()
        {
            return _Productorepository.GetAll() != null ?
                       View(await _Productorepository.GetAll()) :
                       Problem("Entity set 'ApplicationDbContext.PRODUCTOs'  is null.");
        }

        // GET: Producto/Details/5
        public async Task<IActionResult> Details(int id)
        {
            if (id == null || _Productorepository.GetAll() == null)
            {
                return NotFound();
            }

            var pRODUCTO = await _Productorepository.GetById(id);
            if (pRODUCTO == null)
            {
                return NotFound();
            }

            return View(pRODUCTO);
        }

        // GET: Producto/Create
        public async Task<IActionResult> Create()
        {

            var products = await _subcategoriaRepository.GetAll();
            _Subcategoria = new List<SelectListItem>();
            foreach (var product in products)
            {
                _Subcategoria.Add(new SelectListItem
                {
                    Text = product.Nombre,
                    Value = product.SubcategoriaId.ToString()
                });
            }
            ViewBag.Subcategoria = _Subcategoria;

            var Marcas = await _MarcaRepository.GetAll();
            _Marca = new List<SelectListItem>();
            foreach (var Marca in Marcas)
            {
                _Marca.Add(new SelectListItem
                {
                    Text = Marca.Nombre,
                    Value = Marca.MarcaId.ToString()
                });
            }
            ViewBag.Marca = _Marca; 

            return View();
        }

        // POST: Producto/Create
        //To protect from overposting attacks, enable the specific properties you want to bind to.
        //For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductoId,Nombre,Descripcion,Cantidad,stockMaximo,stockMinimo ,Estado,SUBCATEGORIA_SubcategoriaId,MARCA_MarcaId")] PRODUCTO pRODUCTO)
        {
            if (ModelState.IsValid)
            {
                await _Productorepository.Add(pRODUCTO);
                await _Productorepository.Save();
                return RedirectToAction(nameof(Index));
            }
            var products = await _subcategoriaRepository.GetAll();
            _Subcategoria = new List<SelectListItem>();
            foreach (var product in products)
            {
                _Subcategoria.Add(new SelectListItem
                {
                    Text = product.Nombre,
                    Value = product.SubcategoriaId.ToString()
                });
            }
            ViewBag.Subcategoria = _Subcategoria;

            var Marcas = await _MarcaRepository.GetAll();
            _Marca = new List<SelectListItem>();
            foreach (var Marca in Marcas)
            {
                _Marca.Add(new SelectListItem
                {
                    Text = Marca.Nombre,
                    Value = Marca.MarcaId.ToString()
                });
            }
            ViewBag.Marca = _Marca;
            return View(pRODUCTO);
        }

        //// GET: Producto/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _Productorepository.GetAll() == null)
            {
                return NotFound();
            }

            var pRODUCTO = await _Productorepository.GetById((int)id);
            if (pRODUCTO == null)
            {
                return NotFound();
            }
            var products = await _subcategoriaRepository.GetAll();
            _Subcategoria = new List<SelectListItem>();
            foreach (var product in products)
            {
                _Subcategoria.Add(new SelectListItem
                {
                    Text = product.Nombre,
                    Value = product.SubcategoriaId.ToString()
                });
            }
            ViewBag.Subcategoria = _Subcategoria;

            var Marcas = await _MarcaRepository.GetAll();
            _Marca = new List<SelectListItem>();
            foreach (var Marca in Marcas)
            {
                _Marca.Add(new SelectListItem
                {
                    Text = Marca.Nombre,
                    Value = Marca.MarcaId.ToString()
                });
            }
            ViewBag.Marca = _Marca;
            return View(pRODUCTO);
        }

        //// POST: Producto/Edit/5
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductoId,Nombre,Descripcion,Cantidad,stockMaximo,stockMinimo ,Estado,SUBCATEGORIA_SubcategoriaId,MARCA_MarcaId")] PRODUCTO pRODUCTO)
        {

            if (id != pRODUCTO.ProductoId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                var result = await _Productorepository.Update(pRODUCTO);
                if (result <= 0)
                {

                    ViewBag.ErrorMessage = "Error al guardar los datos";
                    return View(pRODUCTO);
                }
                var products = await _subcategoriaRepository.GetAll();
                _Subcategoria = new List<SelectListItem>();
                foreach (var product in products)
                {
                    _Subcategoria.Add(new SelectListItem
                    {
                        Text = product.Nombre,
                        Value = product.SubcategoriaId.ToString()
                    });
                }
                ViewBag.Subcategoria = _Subcategoria;

                var Marcas = await _MarcaRepository.GetAll();
                _Marca = new List<SelectListItem>();
                foreach (var Marca in Marcas)
                {
                    _Marca.Add(new SelectListItem
                    {
                        Text = Marca.Nombre,
                        Value = Marca.MarcaId.ToString()
                    });
                }
                ViewBag.Marca = _Marca;
                return RedirectToAction(nameof(Index));
            }
            
            return View(pRODUCTO);
        }
            
       
        //// GET: Producto/Delete/5
        public async Task<IActionResult> Delete(int id)
        {
            if (id == null || _Productorepository.GetAll() == null)
            {
                return NotFound();
            }

            var pRODUCTO = await _Productorepository.GetById(id);
            if (pRODUCTO == null)
            {
                return NotFound();
            }

            return View(pRODUCTO);
        }

        //// POST: Producto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_Productorepository.GetAll() == null)
            {
                return Problem("Entity set 'ApplicationDbContext.PRODUCTOs'  is null.");
            }
            var pRODUCTO = await _Productorepository.GetById((int)id);
            if (pRODUCTO != null)
            {
                await _Productorepository.Delete(pRODUCTO);
            }

            await _Productorepository.Save();
            return RedirectToAction(nameof(Index));
        }

        //private bool PRODUCTOExists(int id)
        //{
        //    return (_Productorepository.GetAll().Any(e => e.ProductoId == id)).GetValueOrDefault();
        //}

        ///Agregar Cantidad stock
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AgregarCantidad(int id, int cantidadA)
        {
            var producto = await _context.PRODUCTOs.FirstOrDefaultAsync(x => x.ProductoId == id);
            if (producto != null)
            {
                producto.stockMax(cantidadA);

                if (producto.SuperiorStockMax())
                {
                    TempData["ErrorAñadir"] = $"El stock actual del {producto.Nombre}({producto.Cantidad}) supera el stock maximo permitido ({producto.stockMax})";

                    return RedirectToAction("Index", new { id = id });
                }
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", new { id = id });
            }
            else
            {
                return NotFound();
            }
        }

        ////Eliminar cantidad stock
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EliminarCantidad(int id, int cantidadE)
        {
            var producto = await _context.PRODUCTOs.FirstOrDefaultAsync(x => x.ProductoId == id);
            if (producto != null)
            {
                producto.stockMim(cantidadE);

                if (producto.InferiorStockMin())
                {
                    TempData["ErrorEliminar"] = $"El stock actual del {producto.Nombre}({producto.Cantidad}) supera el stock Minimo permitido ({producto.stockMim})";

                    return RedirectToAction("Index", new { id = id });
                }
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", new { id = id });
            }
            else
            {
                return NotFound();
            }

        }

    }
}
