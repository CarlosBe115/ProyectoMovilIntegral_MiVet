using System;
using System.Collections.Generic;

namespace MiVet.Core.Entities
{
    public partial class TbVeterinario : BaseEntity
    {
        public string Nombre { get; set; } = null!;
        public string? Telefono { get; set; }
        public string? Correo { get; set; }
    }
}
