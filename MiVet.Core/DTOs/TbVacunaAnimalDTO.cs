using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbVacunaAnimalDTO
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Animal es requerido")]
        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        public int Animal { get; set; }
        
        [Required(ErrorMessage = "Vacuna es requerido")]
        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        public int Vacuna { get; set; }

        [Required(ErrorMessage = "Veterinario es requerido")]
        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        public int Veterinario { get; set; }

        [Required(ErrorMessage = "Evidencia es requerido")]
        public string Evidencia { get; set; } = null!;

        [Required(ErrorMessage = "Fecha es requerido")]
        public DateTime FechaAplicacion { get; set; }
        
        [Required(ErrorMessage = "Listo es requerido")]
        public bool Listo { get; set; }
    }
}
