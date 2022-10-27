using AutoMapper;
using MiVet.Core.DTOs;
using MiVet.Core.Entities;

namespace MiVet.Infrastructure.Mappings
{
    internal class AutomapperProfile : Profile
    {
        public AutomapperProfile()
        {
            CreateMap<TbAnimal, TbAnimalDTO>();
            CreateMap<TbAnimalDTO, TbAnimal>();
            
            CreateMap<TbEspecie, TbEspecieDTO>();
            CreateMap<TbEspecieDTO, TbEspecie>();

            CreateMap<TbEstado, TbEstadoDTO>();
            CreateMap<TbEstadoDTO, TbEstado>();

            CreateMap<TbPadre, TbPadreDTO>();
            CreateMap<TbPadreDTO, TbPadre>();

            CreateMap<TbPata, TbPataDTO>();
            CreateMap<TbPataDTO, TbPata>();

            CreateMap<TbRaza, TbRazaDTO>();
            CreateMap<TbRazaDTO, TbRaza>();

            CreateMap<TbVacunaAnimal, TbVacunaAnimalDTO>();
            CreateMap<TbVacunaAnimalDTO, TbVacunaAnimal>();

            CreateMap<TbVacuna, TbVacunaDTO>();
            CreateMap<TbVacunaDTO, TbVacuna>();

            CreateMap<TbVeterinario, TbVeterinarioDTO>();
            CreateMap<TbVeterinarioDTO, TbVeterinario>();
        }
    }
}
