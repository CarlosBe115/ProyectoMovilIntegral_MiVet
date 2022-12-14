using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MiVet.Core.DTOs;
using MiVet.Core.Entities;
using MiVet.Core.Filters;
using MiVet.Core.Services;

namespace MiVet.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AnimalController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public AnimalController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }

        [Route("pro/")]
        [HttpGet]
        public async Task<IActionResult> GetAnimalesProgramador([FromQuery] TbAnimalsFilters filters)
        {
            var animales = _services.GetAnimales(filters);
            var animalesDTO = _mapper.Map<IEnumerable<TbAnimalDTO>>(animales);
            return Ok(animalesDTO);
        }

        [Route("gen/")]
        [HttpGet]
        public async Task<IActionResult> GetAnimalesGeneral([FromQuery] TbAnimalsFilters filters)
        {
            var animales = _services.GetAnimalesView(filters);
            return Ok(animales);
        }

        [Route("sup/")]
        [HttpPost]
        public async Task<IActionResult> PostSuperAnimal(SuperAnimal animalDTOs)
        {
            var isvalid = await _services.PostSuperAnimal(animalDTOs);
            return Ok(isvalid);
        }

        [HttpPost]
        public async Task<IActionResult> PostAnimal(TbAnimalDTO animalDTOs)
        {
            var animal = _mapper.Map<TbAnimal>(animalDTOs);
            var isvalid = await _services.PostAnimal(animal);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutAnimal(TbAnimalDTO animalDTO)
        {
            var animal = _mapper.Map<TbAnimal>(animalDTO);
            var isvalid = await _services.PutAnimal(animal);
            return Ok(isvalid);
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteAnimal(int Id)
        {
            var isvalid = await _services.DeleteAnimal(Id);
            return Ok(isvalid);
        }

    }
}
