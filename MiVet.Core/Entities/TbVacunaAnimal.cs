using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbVacunaAnimal: BaseEntity
    {
        public int Animal { get; set; }
        public int Vacuna { get; set; }
        public DateTime Fecha { get; set; }
        public bool Listo { get; set; }

        public virtual TbAnimal AnimalNavigation { get; set; } = null!;
        public virtual TbVacuna VacunaNavigation { get; set; } = null!;
    }
}
