using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbRaza : BaseEntity
    {
        public TbRaza()
        {
            TbAnimals = new HashSet<TbAnimal>();
        }

        public int Especie { get; set; }
        public string Nombre { get; set; } = null!;

        public virtual TbEspecie EspecieNavigation { get; set; } = null!;
        public virtual ICollection<TbAnimal> TbAnimals { get; set; }
    }
}
