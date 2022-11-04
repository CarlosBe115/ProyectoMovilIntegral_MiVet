namespace MiVet.Core.Entities
{
    public partial class TbHistorialMedico: BaseEntity
    {
        public int VacunaAnimal { get; set; }

        public virtual TbVacunaAnimal VacunaAnimalNavigation { get; set; } = null!;
    }
}
