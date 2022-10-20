using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MiVet.Core.DTOs;
using MiVet.Core.Entities;
using MiVet.Core.Services;

namespace MiVet.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EspecieController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public EspecieController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetEspecies()
        {
            var especies = _services.GetEspecies();
            var especiesDTO = _mapper.Map<IEnumerable<TbEspecieDTO>>(especies);
            return Ok(especiesDTO);
        }

        [HttpPost]
        public async Task<IActionResult> PostEspecie(TbEspecieDTO especieDTO)
        {
            var especie = _mapper.Map<TbEspecie>(especieDTO);
            var isvalid = await _services.PostEspecies(especie);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutEspecie(TbEspecieDTO especieDTO)
        {
            var especie = _mapper.Map<TbEspecie>(especieDTO);
            var isvalid = await _services.PutEspecies(especie);
            return Ok(isvalid);
        }
    }
}
