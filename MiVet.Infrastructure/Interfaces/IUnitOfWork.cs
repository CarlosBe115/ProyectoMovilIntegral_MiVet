using MiVet.Core.Entities;
using MiVet.Core.Interfaces;

namespace MiVet.Infrastructure.Interfaces
{
    public interface IUnitOfWork : IDisposable
    {
        IRepository<TbAnimal> AnimalRepository { get; }
        IRepository<TbEspecie> EspecieRepository { get; }
        IRepository<TbEstado> EstadoRepository { get; }
        IRepository<TbPadre> PadreRepository { get; }
        IRepository<TbPata> PataRepository { get; }
        IRepository<TbRaza> RazaRepository { get; }
        IRepository<TbVacuna> VacunaRepository { get; }
        IRepository<TbVacunaAnimal> VacunaAnimalRepository { get; }
        IRepository<TbVeterinario> VeterinarioRepository { get; }

        void SaveChanges();
        Task SaveChangesAsync();


    }
}
