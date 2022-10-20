using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbPata : BaseEntity
    {
        public bool Rizquierda { get; set; }
        public bool Rcentro { get; set; }
        public bool Rderecha { get; set; }
        public bool Lizquierda { get; set; }
        public bool Lcentro { get; set; }
        public bool Lderecha { get; set; }

        public virtual TbAnimal IdNavigation { get; set; } = null!;
    }
}
