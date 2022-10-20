using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbPadre : BaseEntity
    {
        public int? Madre { get; set; }
        public int? Padre { get; set; }

        public virtual TbAnimal? MadreNavigation { get; set; }
        public virtual TbAnimal? PadreNavigation { get; set; }
    }
}
