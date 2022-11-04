using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbEspecie : BaseEntity
    {
        public TbEspecie()
        {
            TbRazas = new HashSet<TbRaza>();
            TbVacunas = new HashSet<TbVacuna>();
        }

        public string Nombre { get; set; } = null!;

        public virtual ICollection<TbRaza> TbRazas { get; set; }
        public virtual ICollection<TbVacuna> TbVacunas { get; set; }
    }
}
