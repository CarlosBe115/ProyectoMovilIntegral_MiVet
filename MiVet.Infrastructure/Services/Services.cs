using MiVet.Core.DTOs;
using MiVet.Core.Entities;
using MiVet.Core.Filters;
using MiVet.Core.Interfaces;
using MiVet.Core.Services;
using MiVet.Core.Views;

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

        public IEnumerable<TbAnimal> GetAnimales(TbAnimalsFilters filters)
        {
            var animales = _unitOfWork.AnimalRepository.GetAll();

            if(filters.Id != null) 
                animales = animales.Where(a => a.Id == filters.Id);
            if(filters.Raza != null) 
                animales = animales.Where(a => a.Raza == filters.Raza);
            if(filters.Apodo != null) 
                animales = animales.Where(a => a.Apodo == filters.Apodo);
            if(filters.Nacimiento != null) 
                animales = animales.Where(a => a.Nacimiento == filters.Nacimiento);
            if(filters.Peso != null) 
                animales = animales.Where(a => a.Peso == filters.Peso);
            if(filters.Genero != null) 
                animales = animales.Where(a => a.Genero == filters.Genero);
            if(filters.Estado != null) 
                animales = animales.Where(a => a.Estado == filters.Estado);

            return animales;
        }

        public IEnumerable<TbAnimalViews> GetAnimalesView(TbAnimalsFilters filters)
        {
            TbRazaFilters razaFilters = new TbRazaFilters();

            var animales = _unitOfWork.AnimalRepository.GetAll();
            var raza = GetTbRazaView(razaFilters).ToList();
            var estado = _unitOfWork.EstadoRepository.GetAll().ToList();
            var padre = _unitOfWork.PadreRepository.GetAll().ToList();
            var pata = _unitOfWork.PataRepository.GetAll().ToList();

            if (filters.Id != null)
                animales = animales.Where(a => a.Id == filters.Id);
            if (filters.Raza != null)
                animales = animales.Where(a => a.Raza == filters.Raza);
            if (filters.Apodo != null)
                animales = animales.Where(a => a.Apodo == filters.Apodo);
            if (filters.Nacimiento != null)
                animales = animales.Where(a => a.Nacimiento == filters.Nacimiento);
            if (filters.Peso != null)
                animales = animales.Where(a => a.Peso == filters.Peso);
            if (filters.Genero != null)
                animales = animales.Where(a => a.Genero == filters.Genero);
            if (filters.Estado != null)
                animales = animales.Where(a => a.Estado == filters.Estado);

            var result = (from a in animales
                          join r in raza on a.Raza equals r.Id
                          join e in estado on a.Estado equals e.Id
                          select new TbAnimalViews
                          {
                              Id = a.Id,
                              Especie = (from ra in raza select new TbRazaViews
                                         {
                                             Id = r.Id,
                                             Especie = r.Especie,
                                             Raza = r.Raza,
                                         }).FirstOrDefault(x => x.Id == a.Raza),
                              Apodo = a.Apodo,
                              Nacimiento = a.Nacimiento,
                              Peso = a.Peso,
                              Genero = a.Genero.ToString(),
                              Estado = e.Nombre,
                              Padre = (from p in padre select new TbPadreDTO
                                       {
                                           Id = p.Id,
                                           Padre = p.Padre,
                                           Madre = p.Madre
                                       }).FirstOrDefault(x => x.Id == a.Id),
                          }).ToList();


            for (int i = 0; i < result.Count(); i++)
            {
                if (result[i].Especie.Especie == "Gallo")
                {
                    result[i].Pata = (from p in pata
                                      select new TbPataDTO
                                      {
                                          Id = p.Id,
                                          Rizquierda = p.Rizquierda,
                                          Rcentro = p.Rcentro,
                                          Rderecha = p.Rderecha,
                                          Lizquierda = p.Lizquierda,
                                          Lcentro = p.Lcentro,
                                          Lderecha = p.Lderecha
                                      }).FirstOrDefault(x => x.Id == result[i].Id);
                }

                if (result[i].Genero == "True") result[i].Genero = "Macho";
                else if (result[i].Genero == "False") result[i].Genero = "Hembra";
            }

            return result;
        }

        public async Task<bool> PostAnimal(List<TbAnimal> animal)
        {
            foreach(TbAnimal registro in animal)
                await _unitOfWork.AnimalRepository.Add(registro);

            _unitOfWork.SaveChanges();
            return true;
        }

        public async Task<bool> PutAnimal(TbAnimal animal)
        {
            _unitOfWork.AnimalRepository.Update(animal);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteAnimal(int Id)
        {
            await _unitOfWork.AnimalRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }

        #endregion

        #region Especies

        public IEnumerable<TbEspecie> GetEspecies(TbEspecieFilters filters)
        {
            var especies = _unitOfWork.EspecieRepository.GetAll();

            if (filters.Id != null)
                especies = especies.Where(a => a.Id == filters.Id);
            if (filters.Nombre != null)
                especies = especies.Where(a => a.Nombre == filters.Nombre);

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

        public async Task<bool> DeleteEspecie(int Id)
        {
            await _unitOfWork.EspecieRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }

        #endregion

        #region Historial Medico


        public IEnumerable<TbHistorialMedico> GetHistorialMedico(TbHistorialMedicoFilters filters)
        {
            var historial = _unitOfWork.HistorialMedicoRepository.GetAll();

            if (filters.Id != null)
                historial = historial.Where(a => a.Id == filters.Id);
            if (filters.VacunaAnimal != null)
                historial = historial.Where(a => a.VacunaAnimal == filters.VacunaAnimal);

            return historial;
        }

        public IEnumerable<TbHistorialMedicoViews> GetHistorialMedicoView(TbHistorialMedicoFilters filters)
        {
            TbVacunaAnimalFilter filter = new TbVacunaAnimalFilter();

            var historial = _unitOfWork.HistorialMedicoRepository.GetAll();
            var vacuna = GetVacunaAnimals(filter).ToList();

            if (filters.Id != null)
                historial = historial.Where(a => a.Id == filters.Id);
            if (filters.VacunaAnimal != null)
                historial = historial.Where(a => a.VacunaAnimal == filters.VacunaAnimal);

            var historialView = (from h in historial
                                 select new TbHistorialMedicoViews
                                 {
                                     Id = h.Id,
                                     Consulta = (from v in vacuna select new TbVacunaAnimalDTO
                                               {
                                                   Id = v.Id,
                                                   Vacuna = v.Vacuna,
                                                   Animal = v.Animal,
                                                   Veterinario = v.Veterinario,
                                                   Evidencia = v.Evidencia,
                                                   FechaAplicacion = v.FechaAplicacion,
                                                   Listo = v.Listo
                                               }).FirstOrDefault(x => x.Id == h.VacunaAnimal),
                                 }).ToList();


            return historialView;
        }


        public async Task<bool> PostHistorialMedico(TbHistorialMedico historialMedico)
        {
            await _unitOfWork.HistorialMedicoRepository.Add(historialMedico);
            _unitOfWork.SaveChanges();
            return true;
        }

        public async Task<bool> PutHistorialMedico(TbHistorialMedico historialMedico)
        {
            _unitOfWork.HistorialMedicoRepository.Update(historialMedico);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteHistorialMedico(int Id)
        {
            await _unitOfWork.HistorialMedicoRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }

        #endregion

        #region Patas

        public IEnumerable<TbPata> GetPatas(TbPataFilters filters)
        {
            var patas = _unitOfWork.PataRepository.GetAll();

            if (filters.Id != null)
                patas = patas.Where(a => a.Id == filters.Id);

            if(filters.Rderecha != null && filters.Rcentro != null && filters.Rizquierda != null &&
                filters.Lderecha != null && filters.Lcentro != null && filters.Lizquierda != null)
            {
                patas = patas.Where(x => 
                    x.Rderecha == filters.Rderecha && x.Rcentro == filters.Rcentro && x.Rizquierda == filters.Rizquierda &&
                    x.Lderecha == filters.Lderecha && x.Lcentro == filters.Lcentro && x.Lizquierda == filters.Lizquierda);
            }

            return patas;
        }
        public async Task<bool> PostPatas(TbPata pata)
        {
            await _unitOfWork.PataRepository.Add(pata);
            _unitOfWork.SaveChanges();
            return true;
        }
        public async Task<bool> PutPatas(TbPata pata)
        {
            _unitOfWork.PataRepository.Update(pata);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeletePata(int Id)
        {
            await _unitOfWork.PataRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }

        #endregion

        #region Padre

        public IEnumerable<TbPadre> GetPadres(TbPadreFilter filters)
        {
            var padres = _unitOfWork.PadreRepository.GetAll();

            if (filters.Id != null)
                padres = padres.Where(a => a.Id == filters.Id);
            if (filters.Madre != null)
                padres = padres.Where(a => a.Madre == filters.Madre);
            if (filters.Padre != null)
                padres = padres.Where(a => a.Padre == filters.Padre);

            return padres;
        }
        public async Task<bool> PostPadre(TbPadre padre)
        {
            await _unitOfWork.PadreRepository.Add(padre);
            _unitOfWork.SaveChanges();
            return true;
        }
        public async Task<bool> PutPadre(TbPadre padre)
        {
            _unitOfWork.PadreRepository.Update(padre);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeletePadre(int Id)
        {
            await _unitOfWork.PadreRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }

        #endregion

        #region Raza

        public IEnumerable<TbRaza> GetRazas(TbRazaFilters filters)
        {
            var raza = _unitOfWork.RazaRepository.GetAll();

            if (filters.Id != null)
                raza = raza.Where(a => a.Id == filters.Id);
            if (filters.Especie != null)
                raza = raza.Where(a => a.Especie == filters.Especie);
            if (filters.Nombre != null)
                raza = raza.Where(a => a.Nombre == filters.Nombre);

            return raza;
        }

        public IEnumerable<TbRazaViews> GetTbRazaView(TbRazaFilters filters)
        {
            var raza = _unitOfWork.RazaRepository.GetAll();
            var especie = _unitOfWork.EspecieRepository.GetAll().ToList();

            if (filters.Id != null)
                raza = raza.Where(a => a.Id == filters.Id);
            if (filters.Especie != null)
                raza = raza.Where(a => a.Especie == filters.Especie);
            if (filters.Nombre != null)
                raza = raza.Where(a => a.Nombre == filters.Nombre);

            var result = (from r in raza join e in especie on r.Especie equals e.Id
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

        public async Task<bool> DeleteRaza(int Id)
        {
            await _unitOfWork.RazaRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }

        #endregion

        #region Vacuna

        public IEnumerable<TbVacuna> GetVacunas(TbVacunaFilters filters)
        {
            var vacunas = _unitOfWork.VacunaRepository.GetAll();

            if (filters.Id != null)
                vacunas = vacunas.Where(a => a.Id == filters.Id);
            if (filters.Especie != null)
                vacunas = vacunas.Where(a => a.Especie == filters.Especie);
            if (filters.Nombre != null)
                vacunas = vacunas.Where(a => a.Nombre == filters.Nombre);
            if (filters.Tipo != null)
                vacunas = vacunas.Where(a => a.Tipo == filters.Tipo);
            if (filters.Via != null)
                vacunas = vacunas.Where(a => a.Via == filters.Via);
            if (filters.Momento != null)
                vacunas = vacunas.Where(a => a.Momento == filters.Momento);
            if (filters.NecesitaRefuerzo != null)
                vacunas = vacunas.Where(a => a.NecesitaRefuerzo == filters.NecesitaRefuerzo);
            if (filters.Refuerzo != null)
                vacunas = vacunas.Where(a => a.Refuerzo == filters.Refuerzo);

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

        public async Task<bool> DeleteVacuna(int Id)
        {
            await _unitOfWork.VacunaRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }

        #endregion

        #region Vacuna Animal

        public IEnumerable<TbVacunaAnimalView> GetVacunaAnimalView(TbVacunaAnimalFilter filter)
        {
            var vacunaAnimal = _unitOfWork.VacunaAnimalRepository.GetAll();

            if (filter.Id != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Id == filter.Id);
            if (filter.Animal != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Animal == filter.Animal);
            if (filter.Vacuna != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Vacuna == filter.Vacuna);
            if (filter.Veterinario != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Veterinario == filter.Veterinario);
            if (filter.FechaAplicacion != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.FechaAplicacion == filter.FechaAplicacion);
            if (filter.Listo != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Listo == filter.Listo);

            var animales = _unitOfWork.AnimalRepository.GetAll().ToList();
            var vacuna = _unitOfWork.VacunaRepository.GetAll().ToList();

            var result = (from va in vacunaAnimal
                          join a in animales on va.Animal equals a.Id
                          join v in vacuna on va.Vacuna equals v.Id
                          select new TbVacunaAnimalView
                          {
                              Id = va.Id,
                              Animal = $"{a.Id}({a.Apodo})",
                              Vacuna = v.Nombre,
                              Fecha = va.FechaAplicacion,
                              Listo = va.Listo
                          });

            return result;
        }
        
        public IEnumerable<TbVacunaAnimal> GetVacunaAnimals(TbVacunaAnimalFilter filter)
        {
            var vacunaAnimal = _unitOfWork.VacunaAnimalRepository.GetAll();

            if (filter.Id != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Id == filter.Id);
            if (filter.Animal != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Animal == filter.Animal);
            if (filter.Vacuna != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Vacuna == filter.Vacuna);
            if (filter.FechaAplicacion != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.FechaAplicacion == filter.FechaAplicacion);
            if (filter.Listo != null)
                vacunaAnimal = vacunaAnimal.Where(x => x.Listo == filter.Listo);

            return vacunaAnimal;
        }

        public async Task<bool> PostVacunaAnimal(TbVacunaAnimal tbVacunaAnimal)
        {
            await _unitOfWork.VacunaAnimalRepository.Add(tbVacunaAnimal);
            _unitOfWork.SaveChanges();
            return true;
        }

        public async Task<bool> PutVacunaAnimal(TbVacunaAnimal tbVacunaAnimal) 
        {
            _unitOfWork.VacunaAnimalRepository.Update(tbVacunaAnimal);
            await _unitOfWork.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteVacunaAnimal(int Id) 
        {
            await _unitOfWork.VacunaAnimalRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }


        #endregion

        #region Veterinario

        public IEnumerable<TbVeterinario> GetVeterinarios(TbVeterinarioFilters filters)
        {
            var veterinarios = _unitOfWork.VeterinarioRepository.GetAll();

            if (filters.Id != null)
                veterinarios = veterinarios.Where(a => a.Id == filters.Id);
            if (filters.Nombre != null)
                veterinarios = veterinarios.Where(a => a.Nombre == filters.Nombre);
            if (filters.Telefono != null)
                veterinarios = veterinarios.Where(a => a.Telefono == filters.Telefono);
            if (filters.Correo != null)
                veterinarios = veterinarios.Where(a => a.Correo == filters.Correo);
            

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

        public async Task<bool> DeleteVeterinario(int Id)
        {
            await _unitOfWork.VeterinarioRepository.Delete(Id);
            _unitOfWork.SaveChanges();
            return true;
        }


        #endregion

    }
}
