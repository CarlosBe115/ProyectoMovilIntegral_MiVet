using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MiVet.Core.DTOs;
using MiVet.Core.Entities;
using MiVet.Core.Filters;
using MiVet.Core.Services;

namespace MiVet.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VacunaAnimalController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public VacunaAnimalController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }


        [Route("pro/")]
        [HttpGet]
        public async Task<IActionResult> GetVacunaAnimalsViews([FromQuery] TbVacunaAnimalFilter filters)
        {
            var vacunaAnimal = _services.GetVacunaAnimalView(filters);
            return Ok(vacunaAnimal);
        }

        [Route("gen/")]
        [HttpGet]
        public async Task<IActionResult> GetVacunaAnimals([FromQuery] TbVacunaAnimalFilter filters)
        {
            var vacunaAnimal = _services.GetVacunaAnimals(filters);
            var vacunaAnimalDTO = _mapper.Map<IEnumerable<TbVacunaAnimalDTO>>(vacunaAnimal);
            return Ok(vacunaAnimalDTO);
        }

        [Route("sinvacuna/")]
        [HttpGet]
        public async Task<IActionResult> GetNotVacunaAnimals()
        {
            var notVacunaAnimal = _services.GetNotVacunaAnimals();
            return Ok(notVacunaAnimal);
        }

        [Route("infovacuna/")]
        [HttpGet]
        public async Task<IActionResult> GetInfoVacunaAnimals(string? nombreVacuna)
        {
            var notVacunaAnimal = _services.GetInfoVacunaAnimals(nombreVacuna);
            return Ok(notVacunaAnimal);
        }

        [HttpPost]
        public async Task<IActionResult> PostVacunaAnimal(TbVacunaAnimalDTO vacunaAnimalDTO)
        {
            var vacunaAnimal = _mapper.Map<TbVacunaAnimal>(vacunaAnimalDTO);
            var isvalid = await _services.PostVacunaAnimal(vacunaAnimal);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutVacunaAnimal(TbVacunaAnimalDTO vacunaAnimalDTO)
        {
            var vacunaAnimal = _mapper.Map<TbVacunaAnimal>(vacunaAnimalDTO);
            var isvalid = await _services.PutVacunaAnimal(vacunaAnimal);
            return Ok(isvalid);
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteVacunaAnimal(int Id)
        {
            var isvalid = await _services.DeleteVacunaAnimal(Id);
            return Ok(isvalid);
        }


    }
}
