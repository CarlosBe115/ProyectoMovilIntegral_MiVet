using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbHistorialMedicoDTO
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Vacuna Del Animal es requerido")]
        public int VacunaAnimal { get; set; }
    }
}
