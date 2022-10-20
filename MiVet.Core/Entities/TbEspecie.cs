using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbEspecie : BaseEntity
    {
        public TbEspecie()
        {
            TbRazas = new HashSet<TbRaza>();
        }

        public string Nombre { get; set; } = null!;

        public virtual ICollection<TbRaza> TbRazas { get; set; }
    }
}
