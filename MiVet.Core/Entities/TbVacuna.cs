using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbVacuna : BaseEntity
    {
        public TbVacuna()
        {
            TbVacunaAnimals = new HashSet<TbVacunaAnimal>();
        }

        public string Nombre { get; set; } = null!;
        public string? Tipo { get; set; }
        public string? Via { get; set; }
        public string Momento { get; set; } = null!;
        public bool NecesitaRefuerzo { get; set; }
        public string? PeridoRefuerzo { get; set; }

        public virtual ICollection<TbVacunaAnimal> TbVacunaAnimals { get; set; }
    }
}
