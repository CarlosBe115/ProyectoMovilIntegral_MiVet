using MiVet.Core.Entities;

namespace MiVet.Core.Interfaces
{
    public interface IRepository<T> where T : BaseEntity
    {
        IEnumerable<T> GetAll();
        Task<T> GetById(int Id);
        Task Add(T entity);
        void Update(T entity);
        Task Delete(int Id);
    }
}
