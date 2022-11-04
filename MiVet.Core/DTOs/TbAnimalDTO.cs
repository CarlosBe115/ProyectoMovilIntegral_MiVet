using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbAnimalDTO
    {
        public int Id { get; set; }

        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        [Required(ErrorMessage = "Raza es requerido")]
        public int Raza { get; set; }

        [StringLength(maximumLength: 50, ErrorMessage = "Apodo no debe tener mas de 50 caracteres")]
        public string? Apodo { get; set; }

        [Required(ErrorMessage = "Fecha es requerido")]
        public DateTime Nacimiento { get; set; }

        [StringLength(maximumLength: 20, ErrorMessage = "Peso no debe tener mas de 20 caracteres")]
        public string? Peso { get; set; }

        [Required(ErrorMessage = "Genero es requerido")]
        public bool Genero { get; set; }

        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        [Required(ErrorMessage = "Estado es requerido")]
        public int Estado { get; set; }
    }
}
