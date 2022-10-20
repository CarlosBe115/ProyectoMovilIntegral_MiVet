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
    public class VeterinarioController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public VeterinarioController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetVeterinarios()
        {
            var veterinarios = _services.GetVeterinarios();
            var veterinariosDTO = _mapper.Map<IEnumerable<TbVeterinarioDTO>>(veterinarios);
            return Ok(veterinariosDTO);
        }

        [HttpPost]
        public async Task<IActionResult> PostVeterinario(TbVeterinarioDTO veterinarioDTO)
        {
            var veterinario = _mapper.Map<TbVeterinario>(veterinarioDTO);
            var isvalid = await _services.PostVeterinario(veterinario);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutVeterinario(TbVeterinarioDTO veterinarioDTO)
        {
            var veterinario = _mapper.Map<TbVeterinario>(veterinarioDTO);
            var isvalid = await _services.PutVeterinario(veterinario);
            return Ok(isvalid);
        }

    }
}
