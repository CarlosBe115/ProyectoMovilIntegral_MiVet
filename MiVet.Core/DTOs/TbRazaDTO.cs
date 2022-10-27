using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbRazaDTO
    {
        public int Id { get; set; }
        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        [Required(ErrorMessage = "Especie es requerido")]
        public int Especie { get; set; }
        [Required(ErrorMessage = "Nombre es requerido")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "Nombre debe tener de 1 a 50 caracteres")]
        public string Nombre { get; set; } = null!;
    }
}
