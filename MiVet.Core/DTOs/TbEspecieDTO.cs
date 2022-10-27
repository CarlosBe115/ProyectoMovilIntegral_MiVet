using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbEspecieDTO
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Nombre es requerido")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "Nombre debe tener de 1 a 50 caracteres")]
        public string Nombre { get; set; } = null!;
    }
}
