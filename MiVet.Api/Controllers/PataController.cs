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
    public class PataController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public PataController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetPatas([FromQuery] TbPataFilters filters)
        {
            var patas = _services.GetPatas(filters);
            return Ok(patas);
        }

        [HttpPost]
        public async Task<IActionResult> PostPata(TbPataDTO pataDTO)
        {
            var pata = _mapper.Map<TbPata>(pataDTO);
            var isvalid = await _services.PostPatas(pata);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutPata(TbPataDTO pataDTO)
        {
            var pata = _mapper.Map<TbPata>(pataDTO);
            var isvalid = await _services.PutPatas(pata);
            return Ok(isvalid);
        }

        [HttpDelete]
        public async Task<IActionResult> DeletePata(int Id)
        {
            var isvalid = await _services.DeletePata(Id);
            return Ok(isvalid);
        }

    }
}
