using MiVet.Core.Entities;
using MiVet.Core.Interfaces;
using MiVet.Infrastructure.Data;

namespace MiVet.Infrastructure.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly MiVetDBContext _context;
        private readonly IRepository<TbAnimal> _animal = null!;
        private readonly IRepository<TbEspecie> _especie = null!;
        private readonly IRepository<TbEstado> _estado= null!;
        private readonly IRepository<TbHistorialMedico> _historialmedico = null!;
        private readonly IRepository<TbPadre> _padre= null!;
        private readonly IRepository<TbPata> _pata= null!;
        private readonly IRepository<TbRaza> _raza= null!;
        private readonly IRepository<TbVacuna> _vacuna= null!;
        private readonly IRepository<TbVacunaAnimal> _vacunaanimal= null!;
        private readonly IRepository<TbVeterinario> _veterinario= null!;

        public UnitOfWork(MiVetDBContext context)
        {
            _context = context;
        }

        public IRepository<TbAnimal> AnimalRepository => _animal ?? new BaseRepository<TbAnimal>(_context);
        public IRepository<TbEspecie> EspecieRepository => _especie ?? new BaseRepository<TbEspecie>(_context);
        public IRepository<TbEstado> EstadoRepository => _estado ?? new BaseRepository<TbEstado>(_context);
        public IRepository<TbHistorialMedico> HistorialMedicoRepository => _historialmedico ?? new BaseRepository<TbHistorialMedico>(_context);
        public IRepository<TbPadre> PadreRepository => _padre ?? new BaseRepository<TbPadre>(_context);
        public IRepository<TbPata> PataRepository => _pata ?? new BaseRepository<TbPata>(_context);
        public IRepository<TbRaza> RazaRepository => _raza ?? new BaseRepository<TbRaza>(_context);
        public IRepository<TbVacuna> VacunaRepository => _vacuna ?? new BaseRepository<TbVacuna>(_context);
        public IRepository<TbVacunaAnimal> VacunaAnimalRepository => _vacunaanimal ?? new BaseRepository<TbVacunaAnimal>(_context);
        public IRepository<TbVeterinario> VeterinarioRepository => _veterinario ?? new BaseRepository<TbVeterinario>(_context);

        public void Dispose()
        {
            if (_context != null) _context.Dispose();
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
