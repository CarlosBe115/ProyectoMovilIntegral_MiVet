using MiVet.Core.DTOs;

namespace MiVet.Core.Views
{
    public class TbAnimalViews
    {
        public int Id { get; set; }
        public virtual TbRazaViews? Especie { get; set; }
        public string? Apodo { get; set; }
        public DateTime Nacimiento { get; set; }
        public string? Peso { get; set; }
        public string? Genero { get; set; }
        public string? Estado { get; set; }
        public virtual TbPadreDTO? Padre { get; set; }
        public virtual TbPataDTO? Pata { get; set; }
    }
}
