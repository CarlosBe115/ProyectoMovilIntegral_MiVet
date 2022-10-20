namespace MiVet.Core.Views
{
    public class TbVacunaAnimalView
    {
        public int Id { get; set; }
        public string? Animal { get; set; }
        public string? Vacuna { get; set; }
        public DateTime Fecha { get; set; }
        public bool Listo { get; set; }
    }
}
