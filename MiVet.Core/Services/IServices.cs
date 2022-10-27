using MiVet.Core.Entities;
using MiVet.Core.Filters;
using MiVet.Core.Views;

namespace MiVet.Core.Services
{
    public interface IServices
    {

        #region Animales

        IEnumerable<TbAnimalViews> GetAnimalesView();
        IEnumerable<TbAnimal> GetAnimales(TbAnimalsFilters filters);
        Task<bool> PostAnimal(List<TbAnimal> data);
        Task<bool> PutAnimal(TbAnimal data);
        Task<bool> DeleteAnimal(int Id);

        #endregion

        #region Especies

        IEnumerable<TbEspecie> GetEspecies(TbEspecieFilters filters);
        Task<bool> PostEspecies(TbEspecie data);
        Task<bool> PutEspecies(TbEspecie data);
        Task<bool> DeleteEspecie(int Id);

        #endregion

        #region Raza

        IEnumerable<TbRazaViews> GetTbRazaView();
        IEnumerable<TbRaza> GetRazas(TbRazaFilters filters);
        Task<bool> PostRazas(TbRaza data);
        Task<bool> PutRazas(TbRaza data);
        Task<bool> DeleteRaza(int Id);

        #endregion

        #region Patas

        IEnumerable<TbPata> GetPatas(TbPataFilters filters);
        Task<bool> PostPatas(TbPata data);
        Task<bool> PutPatas(TbPata data);
        Task<bool> DeletePata(int Id);


        #endregion

        #region Padre

        IEnumerable<TbPadre> GetPadres(TbPadreFilter filters);
        Task<bool> PostPadre(TbPadre data);
        Task<bool> PutPadre(TbPadre data);
        Task<bool> DeletePadre(int Id);

        #endregion

        #region Vacuna

        IEnumerable<TbVacuna> GetVacunas(TbVacunaFilters filters);
        Task<bool> PostVacuna(TbVacuna data);
        Task<bool> PutVacuna(TbVacuna data);
        Task<bool> DeleteVacuna(int Id);
        #endregion

        #region Vacuna Animal

        IEnumerable<TbVacunaAnimalView> GetVacunaAnimalView(TbVacunaAnimalFilter filter);
        IEnumerable<TbVacunaAnimal> GetVacunaAnimals(TbVacunaAnimalFilter filter);
        Task<bool> PostVacunaAnimal(TbVacunaAnimal data);
        Task<bool> PutVacunaAnimal(TbVacunaAnimal data);
        Task<bool> DeleteVacunaAnimal(int Id);


        #endregion

        #region Veterinario

        IEnumerable<TbVeterinario> GetVeterinarios(TbVeterinarioFilters filters);
        Task<bool> PostVeterinario(TbVeterinario data);
        Task<bool> PutVeterinario(TbVeterinario data);
        Task<bool> DeleteVeterinario(int Id);

        #endregion

    }
}
