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

            CreateMap<TbRaza, TbRazaDTO>();
            CreateMap<TbRazaDTO, TbRaza>();

            CreateMap<TbVeterinario, TbVeterinarioDTO>();
            CreateMap<TbVeterinarioDTO, TbVeterinario>();
        }
    }
}
