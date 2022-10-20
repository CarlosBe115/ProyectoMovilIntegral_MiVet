using Microsoft.EntityFrameworkCore;
using MiVet.Core.Entities;
using MiVet.Core.Interfaces;
using MiVet.Infrastructure.Data;

namespace MiVet.Infrastructure.Repositories
{
    public class BaseRepository<T> : IRepository<T> where T : BaseEntity
    {
        private readonly MiVetDBContext _context;
        protected readonly DbSet<T> _entities;

        public BaseRepository(MiVetDBContext context)
        {
            _context = context;
            _entities = context.Set<T>();
        }

        public IEnumerable<T> GetAll()
        {
            return _entities.AsEnumerable();
        }

        public async Task<T> GetById(int Id)
        {
            return await _entities.FindAsync(Id);
        }

        public async Task Add(T entity)
        {
            await _entities.AddAsync(entity);
        }

        public void Update(T entity)
        {
            _entities.Update(entity);
        }

        public async Task Delete(int Id)
        {
            T entity = await GetById(Id);
            _entities.Remove(entity);
        }
    }
}
