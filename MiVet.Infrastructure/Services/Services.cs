using MiVet.Core.Entities;
using MiVet.Core.Interfaces;
using MiVet.Core.Services;
using MiVet.Core.Views;
using System.Security.Cryptography;

namespace MiVet.Infrastructure.Services
{
    public class Services : IServices
    {
        private readonly IUnitOfWork _unitOfWork = null!;
        public Services(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        #region Animales

        public IEnumerable<TbAnimal> GetAnimales()
        {
            var animales = _unitOfWork.AnimalRepository.GetAll();
            return animales;
        }

        public IEnumerable<TbAnimalViews> GetAnimalesView()
        {
            var animales = _unitOfWork.AnimalRepository.GetAll().ToList();
            var raza = _unitOfWork.RazaRepository.GetAll().ToList();
            var estado = _unitOfWork.EstadoRepository.GetAll().ToList();

            var result = (from a in animales join r in raza on a.Raza equals r.Id
                          join e in estado on a.Estado equals e.Id
                          select new TbAnimalViews
                          {
                              Id = a.Id,
                              Raza = r.Nombre,
                              Apodo = a.Apodo,
                              Nacimiento = a.Nacimiento,
                              Peso = a.Peso,
                              Genero = a.Genero.ToString(),
                              Estado = e.Nombre
                          }).ToList();

            for (int i = 0; i < result.Count(); i++)
            {
                if (result[i].Genero == "True") result[i].Genero = "Macho";
                else if (result[i].Genero == "False") result[i].Genero = "Hembra";
            }

            return result;
        }

        public async Task<bool> PostAnimal(TbAnimal animal)
        {
            await _unitOfWork.AnimalRepository.Add(animal);
            _unitOfWork.SaveChanges();
            return true;
        }

        public async Task<bool> PutAnimal(TbAnimal animal)
        {
            _unitOfWork.AnimalRepository.Update(animal);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        #endregion

        #region Especies

        public IEnumerable<TbEspecie> GetEspecies()
        {
            var especies = _unitOfWork.EspecieRepository.GetAll();
            return especies;
        }

        public async Task<bool> PostEspecies(TbEspecie especie)
        {
            await _unitOfWork.EspecieRepository.Add(especie);
            _unitOfWork.SaveChanges();
            return true;
        }

        public async Task<bool> PutEspecies(TbEspecie especie)
        {
            _unitOfWork.EspecieRepository.Update(especie);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        #endregion

        #region Raza

        public IEnumerable<TbRaza> GetRazas()
        {
            var raza = _unitOfWork.RazaRepository.GetAll();
            return raza;
        }

        public IEnumerable<TbRazaViews> GetTbRazaView()
        {
            var raza = _unitOfWork.RazaRepository.GetAll().ToList();
            var especie = _unitOfWork.EspecieRepository.GetAll().ToList();

            var result = (from r in raza join e in especie
                          on r.Especie equals e.Id
                          select new TbRazaViews
                          {
                              Id = r.Id,
                              Especie = e.Nombre,
                              Raza = r.Nombre
                          });

            return result;
        }

        public async Task<bool> PostRazas(TbRaza raza)
        {
            await _unitOfWork.RazaRepository.Add(raza);
            _unitOfWork.SaveChanges();
            return true;
        }

        public async Task<bool> PutRazas(TbRaza raza)
        {
            _unitOfWork.RazaRepository.Update(raza);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        #endregion

        #region Vacuna

        public IEnumerable<TbVacuna> GetVacunas()
        {
            var vacunas = _unitOfWork.VacunaRepository.GetAll();
            return vacunas;
        }

        public async Task<bool> PostVacuna(TbVacuna vacuna)
        {
            await _unitOfWork.VacunaRepository.Add(vacuna);
            _unitOfWork.SaveChanges();
            return true;
        }

        public async Task<bool> PutVacuna(TbVacuna vacuna)
        {
            _unitOfWork.VacunaRepository.Update(vacuna);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        #endregion

        #region VacunaAnimal

        public IEnumerable<TbVacunaAnimalView> GetVacunaAnimalView()
        {
            var vacunaAnimal = _unitOfWork.VacunaAnimalRepository.GetAll().ToList();
            var animales = _unitOfWork.AnimalRepository.GetAll().ToList();
            var vacuna = _unitOfWork.VacunaRepository.GetAll().ToList();

            var result = (from va in vacunaAnimal
                          join a in animales
                          on va.Animal equals a.Id
                          join v in vacuna
                          on va.Vacuna equals v.Id
                          select new TbVacunaAnimalView
                          {
                              Id = va.Id,
                              Animal = $"{a.Id}({a.Apodo})",
                              Vacuna = v.Nombre,
                              Fecha = va.Fecha,
                              Listo = va.Listo
                          });

            return result;
        }

        #endregion

        #region Veterinario

        public IEnumerable<TbVeterinario> GetVeterinarios()
        {
            var veterinarios = _unitOfWork.VeterinarioRepository.GetAll();
            return veterinarios;
        }

        public async Task<bool> PostVeterinario(TbVeterinario veterinario)
        {
            await _unitOfWork.VeterinarioRepository.Add(veterinario);
            _unitOfWork.SaveChanges();
            return true;
        }

        public async Task<bool> PutVeterinario(TbVeterinario veterinario)
        {
            _unitOfWork.VeterinarioRepository.Update(veterinario);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        #endregion
    
    }
}
