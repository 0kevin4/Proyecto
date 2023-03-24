using CRUDInventoryQuick.Datos;
using CRUDInventoryQuick.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace CRUDInventoryQuick.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {

        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext _context;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            //Producto mas vendido
            var product = _context.PRODUCTOs.Include(p => p.TRANSACCIONs)
                                    .Select(p => new
                                    {
                                        Producto = p,
                                        TotalVendido = p.TRANSACCIONs
                                                         .Where(t => t.TipoTransaccion == "Salida")
                                                         .Sum(t => t.Cantidad)
                                    })
                                    .OrderByDescending(p => p.TotalVendido)
                                    .Take(1)
                                    .ToList();

            ViewBag.ProductoMasVendido = product.FirstOrDefault()?.Producto?.Nombre;

    //////////////////////Stock Minimo////////////////////////
   
            //Notificacion Stock Minimo
            var productos = _context.PRODUCTOs.ToList();

            // Lista de productos con stock mínimo
            var productosBajoStock = new List<PRODUCTO>();

            // Verificar si algún producto tiene stock mínimo
            foreach (var producto in productos)
            {
                if (producto.Cantidad < producto.stockMinimo)
                {
                    productosBajoStock.Add(producto);
                }
            }

            // Pasar la lista de productos bajo stock a la vista
            ViewBag.ProductosBajoStock = productosBajoStock;

    //////////////////////Stock Maximo////////////////////////
    
            // Lista de productos con stock Maximo
            var productosMaximoStock = new List<PRODUCTO>();

            // Verificar si algún producto tiene stock Maximo
            foreach (var producto in productos)
            {
                if (producto.Cantidad > producto.stockMaximo)
                {
                    productosMaximoStock.Add(producto);
                }
            }

            // Pasar la lista de productos Maximo stock a la vista
            ViewBag.ProductosMaximoStock = productosMaximoStock;

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}