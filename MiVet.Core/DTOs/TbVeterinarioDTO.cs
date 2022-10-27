using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbVeterinarioDTO
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Nombre es requerido")]
        [StringLength(125, MinimumLength = 1, ErrorMessage = "Nombre debe tener de 1 a 125 caracteres")]
        public string Nombre { get; set; } = null!;
        [StringLength(maximumLength: 20, ErrorMessage = "Apodo no debe tener mas de 20 caracteres")]
        public string? Telefono { get; set; }
        [StringLength(maximumLength: 125, ErrorMessage = "Correo no debe tener mas de 125 caracteres")]
        public string? Correo { get; set; }
    }
}
