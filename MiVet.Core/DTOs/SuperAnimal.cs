using System.ComponentModel.DataAnnotations;

namespace MiVet.Core.DTOs
{
    public class SuperAnimal
    {
        //---------------------------------- A N I M A L ---------------------------------
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
        //---------------------------------- P A D R E S ---------------------------------
        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        [Required(ErrorMessage = "Madre es requerido")]
        public int? Madre { get; set; }
        
        [RegularExpression("(^[0-9]+$)", ErrorMessage = "Expresion erronea, solo se permiten valores numericos")]
        [Required(ErrorMessage = "Padre es requerido")]
        public int? Padre { get; set; }
        //---------------------------------- P A T A S ---------------------------------
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
