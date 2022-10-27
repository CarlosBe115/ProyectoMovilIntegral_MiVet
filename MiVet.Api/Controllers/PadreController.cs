using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MiVet.Core.DTOs;
using MiVet.Core.Entities;
using MiVet.Core.Filters;
using MiVet.Core.Services;

namespace MiVet.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PadreController : ControllerBase
    {
        private readonly IServices _services;
        private readonly IMapper _mapper;
        public PadreController(IServices services, IMapper mapper)
        {
            _services = services;
            _mapper = mapper;
        }


        [HttpGet]
        public async Task<IActionResult> GetPadre([FromQuery]TbPadreFilter filter)
        {
            var padres = _services.GetPadres(filter);
            var padresDTO = _mapper.Map<IEnumerable<TbPadreDTO>>(padres);
            return Ok(padresDTO);
        }


        [HttpPost]
        public async Task<IActionResult> PostPadre(TbPadreDTO padreDTO)
        {
            var padre = _mapper.Map<TbPadre>(padreDTO);
            var isvalid = await _services.PostPadre(padre);
            return Ok(isvalid);
        }

        [HttpPut]
        public async Task<IActionResult> PutPadre(TbPadreDTO padreDTO)
        {
            var padre = _mapper.Map<TbPadre>(padreDTO);
            var isvalid = await _services.PutPadre(padre);
            return Ok(isvalid);
        }

        [HttpDelete]
        public async Task<IActionResult> DeletePadre(int Id)
        {
            var isvalid = await _services.DeletePadre(Id);
            return Ok(isvalid);
        }

    }
}
