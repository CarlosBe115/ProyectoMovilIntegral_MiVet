using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbVacunaDTO
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Nombre es requerido")]
        [StringLength(75, MinimumLength = 1, ErrorMessage = "Nombre debe tener de 1 a 75 caracteres")]
        public string Nombre { get; set; } = null!;
        [StringLength(maximumLength: 150, ErrorMessage = "Tipo no debe tener mas de 150 caracteres")]
        public string? Tipo { get; set; }
        [StringLength(maximumLength: 50, ErrorMessage = "Via no debe tener mas de 50 caracteres")]
        public string? Via { get; set; }
        [Required(ErrorMessage = "Momento es requerido")]
        [StringLength(75, MinimumLength = 1, ErrorMessage = "Nombre debe tener de 1 a 75 caracteres")]
        public string Momento { get; set; } = null!;
        [Required(ErrorMessage = "Necesita Refuerzo es requerido")]
        public bool NecesitaRefuerzo { get; set; }
        [StringLength(maximumLength: 50, ErrorMessage = "Via no debe tener mas de 50 caracteres")]
        public string? PeridoRefuerzo { get; set; }
    }
}
