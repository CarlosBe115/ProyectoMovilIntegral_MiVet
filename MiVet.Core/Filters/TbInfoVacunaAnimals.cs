using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiVet.Core.Filters
{
    public class TbInfoVacunaAnimals
    {
        public int IdVacuna { get; set; }
        public int IdAnimal { get; set; }
        public string? Apodo { get; set; }
        public DateTime Aplicacion { get; set; }
        public bool? Listo { get; set; }
        public string? NombreVacuna { get; set; }
        public string? TipoVacuna { get; set; }
        public string? ViaVacuna { get; set; }
        public int Momento { get; set; }
        public bool NecesitaRefuerzo { get; set; }
        public int? Refuerzo { get; set; }

    }
}
