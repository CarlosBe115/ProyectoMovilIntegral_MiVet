using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class TbPadreDTO
    {
        public int? Id { get; set; }
        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        public int? Madre { get; set; }
        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        public int? Padre { get; set; }
    }
}
