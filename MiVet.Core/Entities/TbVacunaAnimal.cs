using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbVacunaAnimal: BaseEntity
    {
        public TbVacunaAnimal()
        {
            TbHistorialMedicos = new HashSet<TbHistorialMedico>();
        }

        public int Animal { get; set; }
        public int Vacuna { get; set; }
        public int Veterinario { get; set; }
        public string Evidencia { get; set; } = null!;
        public DateTime FechaAplicacion { get; set; }
        public bool Listo { get; set; }

        public virtual TbAnimal AnimalNavigation { get; set; } = null!;
        public virtual TbVacuna VacunaNavigation { get; set; } = null!;
        public virtual TbVeterinario VeterinarioNavigation { get; set; } = null!;
        public virtual ICollection<TbHistorialMedico> TbHistorialMedicos { get; set; }
    }
}
