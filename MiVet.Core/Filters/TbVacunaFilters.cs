using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.Filters
{
    public class TbVacunaFilters
    {
        public int? Id { get; set; }
        public int? Especie { get; set; }
        public string? Nombre { get; set; }
        public string? Tipo { get; set; }
        public string? Via { get; set; }
        public int? Momento { get; set; }
        public bool? NecesitaRefuerzo { get; set; }
        public int? Refuerzo { get; set; }
    }
}
