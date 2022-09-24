using CRUDInventoryQuick.Contracts;
using CRUDInventoryQuick.Datos;
using CRUDInventoryQuick.Models;

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
            return _context.PRODUCTOs.ToList();
        }

        public async Task<PRODUCTO> GetById(int id)
        {
            return _context.PRODUCTOs.SingleOrDefault(c => c.ProductoId.Equals(id));
        }

        public  Task Add(PRODUCTO pRODUCTO)
        {
             _context.AddAsync(pRODUCTO);
             _context.SaveChanges();
             return Task.CompletedTask;
        }

        public Task Delete(PRODUCTO? t)
        {
            throw new NotImplementedException();
        }

        public Task<int> Update(PRODUCTO? t)
        {
            throw new NotImplementedException();
        }

        public Task Save()
        {
            _context.SaveChanges();
            return Task.CompletedTask;
        }
    }
}
