using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbVeterinario : BaseEntity
    {
        public TbVeterinario()
        {
            TbVacunaAnimals = new HashSet<TbVacunaAnimal>();
        }

        public string Nombre { get; set; } = null!;
        public string? Telefono { get; set; }
        public string? Correo { get; set; }

        public virtual ICollection<TbVacunaAnimal> TbVacunaAnimals { get; set; }
    }
}
