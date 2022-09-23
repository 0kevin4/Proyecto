using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRUDInventoryQuick.Datos;
using CRUDInventoryQuick.Models;
using CRUDInventoryQuick.Contracts;

namespace CRUDInventoryQuick.Controllers
{
    public class PrecioController : Controller
    {
        private readonly IRepository<PRECIO>_repository;

        public PrecioController(IRepository<PRECIO> repository)
        {
            _repository = repository;
        }

        // GET: Precio
        public async Task<IActionResult> Index()
        {
            return _repository.GetAll() != null ?
                        View(await _repository.GetAll()) :
                        Problem("Entity set 'ApplicationDbContext.CATEGORIAs'  is null.");
        }




        // GET: Precio/Details/5
        public async Task<IActionResult> Details(int id)
        {
            if (id == 0)
            {
                return NotFound();
            }

            var pRECIO = await _repository.GetById(id);
            if (pRECIO == null)
            {
                return NotFound();
            }

            return View(pRECIO);
        }

        // GET: Precio/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Precio/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PrecioId,FechaIngreso,PrecioCompra,Descuento,PrecioVentaInicial,PrecioVentaFinal")]PRECIO pRECIO)
        {
            if (ModelState.IsValid)
            {
                await _repository.Add(pRECIO);
                await _repository.Save();
                return RedirectToAction(nameof(Index));
            }
            return View(pRECIO);
        }

        // GET: Precio/Edit/5
        public async Task<IActionResult> Edit(int id)
        {
            if (id == 0)
            {
                return NotFound();
            }

            var pRECIO = await _repository.GetById(id);
            if (pRECIO == null)
            {
                return NotFound();
            }
            return View(pRECIO);
        }

        // POST: Precio/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PrecioId,FechaIngreso,PrecioCompra,Descuento,PrecioVentaInicial,PrecioVentaFinal")] PRECIO pRECIO)
        {
            if (id != pRECIO.PrecioId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                var result = await _repository.Update(pRECIO);
                if (result <= 0)
                {

                    ViewBag.ErrorMessage = "Error al guardar los datos";
                    return View(pRECIO);
                }

                return RedirectToAction(nameof(Index));
            }
            return View(pRECIO);
        }

        //GET: Precio/Delete/5
        public async Task<IActionResult> Delete(int id)
        {
            if (id == 0)
            {
                return NotFound();
            }

            var pRECIO = await _repository.GetById(id);
            if (pRECIO == null)
            {
                return NotFound();
            }

            return View(pRECIO);
        }

        // POST: Precio/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_repository.GetAll() == null)
            {
                return Problem("Entity set 'ApplicationDbContext.PRECIOs'  is null.");
            }
            var pRECIO = await _repository.GetById(id);
            if (pRECIO != null)
            {
                await _repository.Delete(pRECIO);
            }

            await _repository.Save();
            return RedirectToAction(nameof(Index));
        }

        //private bool CATEGORIumExists(int id)
        //{
        //    return (_repository.GetAll().Any(e => e.CategoriaId == id)).GetValueOrDefault();
        //}
    }
}
