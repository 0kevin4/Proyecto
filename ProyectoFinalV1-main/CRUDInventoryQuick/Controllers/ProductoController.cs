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

namespace CRUDInventoryQuick.Controllers
{
    public class ProductoController : Controller
    {
        private readonly IRepository<PRODUCTO> _Productorepository;
        private readonly IRepository<SUBCATEGORIum> _subcategoriaRepository;
        private readonly IRepository<MARCA> _MarcaRepository;
        private List<SelectListItem> _subcategoria;
        private List<SelectListItem> _marca;

        public ProductoController(IRepository<PRODUCTO> Productorepository, IRepository<SUBCATEGORIum> subcategoriaRepository, IRepository<MARCA> MarcaRepository  )
        {
            _Productorepository = Productorepository;
            _subcategoriaRepository = subcategoriaRepository;
            _MarcaRepository = MarcaRepository;
        }

        //GET: Producto
        public async Task<IActionResult> Index()
        {
            return _Productorepository.GetAll() != null ?
                       View(await _Productorepository.GetAll()) :
                       Problem("Entity set 'ApplicationDbContext.CATEGORIAs'  is null.");
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
            _subcategoria= new List<SelectListItem>();
            foreach (var sub in products)
            {
                _subcategoria.Add(new SelectListItem
                {
                    Text = sub.Nombre,
                    Value = sub.SubcategoriaId.ToString()
                });
            }
            ViewBag.subcategorias = _subcategoria;

            var product = await _MarcaRepository.GetAll();
            _marca = new List<SelectListItem>();
            foreach (var mar in product)
            {
                _marca.Add(new SelectListItem
                {
                    Text = mar.Nombre,
                    Value = mar.MarcaId.ToString()
                });
            }
            ViewBag.Marca = _subcategoria;
            return View();
        }

        // POST: Producto/Create
        //To protect from overposting attacks, enable the specific properties you want to bind to.
        //For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProductoId,Nombre,Descripcion,Estado,SUBCATEGORIA_SubcategoriaId,MARCA_MarcaId")] PRODUCTO pRODUCTO)
        {
            if (ModelState.IsValid)
            {
                await _Productorepository.Add(pRODUCTO);
                await _Productorepository.Save();
                return RedirectToAction(nameof(Index));
            }
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
            _subcategoria = new List<SelectListItem>();
            foreach (var produc in products)
            {
                _subcategoria.Add(new SelectListItem
                {
                    Text = produc.Nombre,
                    Value = produc.SubcategoriaId.ToString()
                });
            }
            ViewBag.subcategorias = _subcategoria;

            var product = await _MarcaRepository.GetAll();
            _marca = new List<SelectListItem>();
            foreach (var mar in product)
            {
                _marca.Add(new SelectListItem
                {
                    Text = mar.Nombre,
                    Value = mar.MarcaId.ToString()
                });
            }
            ViewBag.Marca = _subcategoria;
            return View(pRODUCTO);
        }

        //// POST: Producto/Edit/5
        //// To protect from overposting attacks, enable the specific properties you want to bind to.
        //// For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProductoId,Nombre,Descripción,Estado,SUBCATEGORIA_SubcategoriaId,MARCA_MarcaId")] PRODUCTO pRODUCTO)
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

                return RedirectToAction(nameof(Index));
            }
            //ViewData["MARCA_MarcaId"] = new SelectList((System.Collections.IEnumerable)_Productorepository.GetAll(), "MarcaId", "MarcaId", pRODUCTO.MARCA_MarcaId);
            //ViewData["SUBCATEGORIA_SubcategoriaId"] = new SelectList((System.Collections.IEnumerable)_Productorepository.GetAll(), "SubcategoriaId", "SubcategoriaId", pRODUCTO.SUBCATEGORIA_SubcategoriaId);
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
            var pRODUCTO = await _Productorepository.GetById(id);
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
    }
}
