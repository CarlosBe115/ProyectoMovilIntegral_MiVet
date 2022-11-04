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
    public class HistorialMedicoController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public HistorialMedicoController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }

        [Route("pro/")]
        [HttpGet]
        public async Task<IActionResult> GetHistorialMedicoProgramadorView([FromQuery] TbHistorialMedicoFilters filters)
        {
            var historialMedicos = _services.GetHistorialMedico(filters);
            var historialMedicosDTO = _mapper.Map<IEnumerable<TbHistorialMedicoDTO>>(historialMedicos);
            return Ok(historialMedicosDTO);
        }

        [Route("gen/")]
        [HttpGet]
        public async Task<IActionResult> GetHistorialMedicoProgramador([FromQuery] TbHistorialMedicoFilters filters)
        {
            var historialMedicos = _services.GetHistorialMedicoView(filters);
            return Ok(historialMedicos);
        }

        [HttpPost]
        public async Task<IActionResult> PostHistorialMedico(TbHistorialMedicoDTO historialMedicoDTO)
        {
            var historialMedico = _mapper.Map<TbHistorialMedico>(historialMedicoDTO);
            var isvalid = await _services.PostHistorialMedico(historialMedico);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutHistorialMedico(TbHistorialMedicoDTO historialMedicoDTO)
        {
            var historialMedico = _mapper.Map<TbHistorialMedico>(historialMedicoDTO);
            var isvalid = await _services.PutHistorialMedico(historialMedico);
            return Ok(isvalid);
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteHistorialMedico(int Id)
        {
            var isvalid = await _services.DeleteHistorialMedico(Id);
            return Ok(isvalid);
        }
    }
}
