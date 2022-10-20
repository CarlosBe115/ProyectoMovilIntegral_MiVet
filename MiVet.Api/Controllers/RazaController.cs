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
    public class RazaController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public RazaController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }

        [Route("pro/")]
        [HttpGet]
        public async Task<IActionResult> GetRazasProgramador()
        {
            var raza = _services.GetRazas();
            var razaDTO = _mapper.Map<IEnumerable<TbRazaDTO>>(raza);
            return Ok(razaDTO);
        }

        [Route("gen/")]
        [HttpGet]
        public async Task<IActionResult> GetRazasGeneral()
        {
            var raza = _services.GetTbRazaView();
            return Ok(raza);
        }


        [HttpPost]
        public async Task<IActionResult> PostRaza(TbRazaDTO razaDTO)
        {
            var raza = _mapper.Map<TbRaza>(razaDTO);
            var isvalid = await _services.PostRazas(raza);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutRaza(TbRazaDTO razaDTO)
        {
            var raza = _mapper.Map<TbRaza>(razaDTO);
            var isvalid = await _services.PutRazas(raza);
            return Ok(isvalid);
        }
    }
}
