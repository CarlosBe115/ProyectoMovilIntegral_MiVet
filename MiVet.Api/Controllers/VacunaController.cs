using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MiVet.Core.DTOs;
using MiVet.Core.Entities;
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
        public async Task<IActionResult> GetVacunas()
        {
            var raza = _services.GetRazas();
            var razaDTO = _mapper.Map<IEnumerable<TbRazaDTO>>(raza);
            return Ok(razaDTO);
        }

        [HttpPost]
        public async Task<IActionResult> PostVacuna(TbRazaDTO razaDTO)
        {
            var raza = _mapper.Map<TbRaza>(razaDTO);
            var isvalid = await _services.PostRazas(raza);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutVacuna(TbRazaDTO razaDTO)
        {
            var raza = _mapper.Map<TbRaza>(razaDTO);
            var isvalid = await _services.PutRazas(raza);
            return Ok(isvalid);
        }
    }
}
