using CRUDInventoryQuick.Contracts;
using CRUDInventoryQuick.Datos;
using CRUDInventoryQuick.Models;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;

namespace CRUDInventoryQuick.Repositorio
{
    public class TransaccionRepository : IRepository<TRANSACCION>
    {
        private readonly ApplicationDbContext _context;

        public TransaccionRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<TRANSACCION>> GetAll()
        {
            var context = _context.TRANSACCIONs.Include(p => p.Producto);

            return context.ToList();
        }

        public async Task<TRANSACCION> GetById(int id)
        {
            return await _context.TRANSACCIONs.Include(p => p.Producto)
              .FirstOrDefaultAsync(m => m.Id == id);
        }

        public Task Add(TRANSACCION transaccion)
        {
            _context.AddAsync(transaccion);
            return Task.CompletedTask;
        }

        public Task Delete(TRANSACCION transaccion)
        {
            _context.Remove(transaccion);
            _context.SaveChanges();
            return Task.CompletedTask;
        }

        public Task<int> Update(TRANSACCION transaccion)
        {
            _context.Update(transaccion);
            return _context.SaveChangesAsync();
        }

        public Task Save()
        {
            _context.SaveChangesAsync();
            return Task.CompletedTask;
        }

        public Task<TRANSACCION> GetSingle(Expression<Func<TRANSACCION, bool>> predicate)
        {
            throw new NotImplementedException();
        }
    }
}
