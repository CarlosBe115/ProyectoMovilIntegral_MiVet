using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbAnimal : BaseEntity
    {
        public TbAnimal()
        {
            TbPadreMadreNavigations = new HashSet<TbPadre>();
            TbPadrePadreNavigations = new HashSet<TbPadre>();
            TbVacunaAnimals = new HashSet<TbVacunaAnimal>();
        }

        public int Raza { get; set; }
        public string? Apodo { get; set; }
        public DateTime Nacimiento { get; set; }
        public string? Peso { get; set; }
        public bool Genero { get; set; }
        public int Estado { get; set; }

        public virtual TbEstado EstadoNavigation { get; set; } = null!;
        public virtual TbRaza RazaNavigation { get; set; } = null!;
        public virtual TbPata? TbPata { get; set; }
        public virtual ICollection<TbPadre> TbPadreMadreNavigations { get; set; }
        public virtual ICollection<TbPadre> TbPadrePadreNavigations { get; set; }
        public virtual ICollection<TbVacunaAnimal> TbVacunaAnimals { get; set; }
    }
}
