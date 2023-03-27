using CRUDInventoryQuick.Models;
using System.Linq.Expressions;

namespace CRUDInventoryQuick.Contracts
{
    public interface IRepository<T> 
    {
        Task<IEnumerable<T>> GetAll();
        Task<T> GetById(int id);
        Task Add(T t);
        Task Delete(T t);
        Task<int> Update(T t);
        Task Save();
        Task<T> GetSingle(Expression<Func<T, bool>> predicate);
    }
}
