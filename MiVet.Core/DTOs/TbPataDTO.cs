using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbPataDTO
    {
        public int? Id { get; set; }
        public bool Rizquierda { get; set; }
        [Required(ErrorMessage = "Pata Derecha, Dedo Medio")]
        public bool Rcentro { get; set; }
        [Required(ErrorMessage = "Pata Derecha, Dedo Derecho")]
        public bool Rderecha { get; set; }
        [Required(ErrorMessage = "Pata Izquierda, Dedo Izquierdo")]
        public bool Lizquierda { get; set; }
        [Required(ErrorMessage = "Pata Izquierda, Dedo Medio")]
        public bool Lcentro { get; set; }
        [Required(ErrorMessage = "Pata Izquierda, Dedo Derecho")]
        public bool Lderecha { get; set; }
    }
}
