using MiVet.Core.Entities;
using MiVet.Core.Views;

namespace MiVet.Core.Services
{
    public interface IServices
    {
        #region Animales

        IEnumerable<TbAnimalViews> GetAnimalesView();
        IEnumerable<TbAnimal> GetAnimales();
        Task<bool> PostAnimal(TbAnimal data);
        Task<bool> PutAnimal(TbAnimal data);

        #endregion

        #region Especies

        IEnumerable<TbEspecie> GetEspecies();
        Task<bool> PostEspecies(TbEspecie data);
        Task<bool> PutEspecies(TbEspecie data);

        #endregion

        #region Raza

        IEnumerable<TbRazaViews> GetTbRazaView();
        IEnumerable<TbRaza> GetRazas();
        Task<bool> PostRazas(TbRaza data);
        Task<bool> PutRazas(TbRaza data);

        #endregion

        #region Vacuna

        IEnumerable<TbVacuna> GetVacunas();
        Task<bool> PostVacuna(TbVacuna data);
        Task<bool> PutVacuna(TbVacuna data);

        #endregion

        #region VacunaAnimal

        IEnumerable<TbVacunaAnimalView> GetVacunaAnimalView();

        #endregion

        #region Veterinario

        IEnumerable<TbVeterinario> GetVeterinarios();
        Task<bool> PostVeterinario(TbVeterinario data);
        Task<bool> PutVeterinario(TbVeterinario data);

        #endregion

    }
}
