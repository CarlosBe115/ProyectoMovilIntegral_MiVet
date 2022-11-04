namespace MiVet.Core.Entities
{
    public partial class TbEstado : BaseEntity
    {
        public TbEstado()
        {
            TbAnimals = new HashSet<TbAnimal>();
        }

        public string Nombre { get; set; } = null!;

        public virtual ICollection<TbAnimal> TbAnimals { get; set; }
    }
}
