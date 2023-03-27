using CRUDInventoryQuick.Contracts;
using CRUDInventoryQuick.Datos;
using CRUDInventoryQuick.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace CRUDInventoryQuick.Repositorio
{
    public class ProductoRepository : IRepository<PRODUCTO>
    {
        private readonly ApplicationDbContext _context;
        
        public ProductoRepository(ApplicationDbContext context)
        {
            this._context = context;
        }

        public async Task<IEnumerable<PRODUCTO>> GetAll()
        {
            var applicationDbContext = _context.PRODUCTOs
                .Include(p => p.Marca)
                .Include(p => p.Subcategoria);
            return applicationDbContext.ToList();
        }

        public async Task<PRODUCTO> GetById(int id)
        {
           return await _context.PRODUCTOs
                .Include(p => p.Marca)
                .Include(p => p.Subcategoria)
                .FirstOrDefaultAsync(m => m.ProductoId == id);

        }

        public  Task Add(PRODUCTO pRODUCTO)
        {
             _context.AddAsync(pRODUCTO);
             _context.SaveChanges();
             return Task.CompletedTask;
        }

        public Task Delete(PRODUCTO pRODUCTO)
        {
            _context.Remove(pRODUCTO);
            _context.SaveChanges();
            return Task.CompletedTask;
        }

        public async Task<int> Update(PRODUCTO pRODUCTO)
        {
            _context.Update(pRODUCTO);
            return await _context.SaveChangesAsync();

        }

        public Task Save()
        {
            _context.SaveChangesAsync();
            return Task.CompletedTask;
        }

        public async Task<PRODUCTO> GetSingle(Expression<Func<PRODUCTO, bool>> predicate)
        {
            return await _context.PRODUCTOs.SingleOrDefaultAsync(predicate);
        }
    }
}
