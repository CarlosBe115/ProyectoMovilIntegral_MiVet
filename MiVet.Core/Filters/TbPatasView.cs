using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiVet.Core.Filters
{
    public class TbPatasView
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public bool Rizquierda { get; set; }
        public bool Rcentro { get; set; }
        public bool Rderecha { get; set; }
        public bool Lizquierda { get; set; }
        public bool Lcentro { get; set; }
        public bool Lderecha { get; set; }
    }
}
