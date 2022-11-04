namespace MiVet.Core.Entities
{
    public partial class TbVacuna : BaseEntity
    {
        public TbVacuna()
        {
            TbVacunaAnimals = new HashSet<TbVacunaAnimal>();
        }

        public int Especie { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Tipo { get; set; }
        public string? Via { get; set; }
        public int Momento { get; set; }
        public bool NecesitaRefuerzo { get; set; }
        public int? Refuerzo { get; set; }

        public virtual TbEspecie EspecieNavigation { get; set; } = null!;
        public virtual ICollection<TbVacunaAnimal> TbVacunaAnimals { get; set; }
    }
}
