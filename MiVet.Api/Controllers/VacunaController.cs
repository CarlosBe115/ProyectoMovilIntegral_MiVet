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
    public class VacunaController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public VacunaController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetVacunas([FromQuery]TbVacunaFilters filters)
        {
            var vacunas = _services.GetVacunas(filters);
            var vacunasDTO = _mapper.Map<IEnumerable<TbVacunaDTO>>(vacunas);
            return Ok(vacunasDTO);
        }

        [HttpPost]
        public async Task<IActionResult> PostVacuna(TbVacunaDTO vacunaDTO)
        {
            var vacuna = _mapper.Map<TbVacuna>(vacunaDTO);
            var isvalid = await _services.PostVacuna(vacuna);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutVacuna(TbVacunaDTO tbVacunaDTO)
        {
            var vacuna = _mapper.Map<TbVacuna>(tbVacunaDTO);
            var isvalid = await _services.PutVacuna(vacuna);
            return Ok(isvalid);
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteVacuna(int Id)
        {
            var isvalid = await _services.DeleteVacuna(Id);
            return Ok(isvalid);
        }

    }
}
