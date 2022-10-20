namespace MiVet.Core.DTOs
{
    public class TbVacunaAnimalDTO
    {
        public int Id { get; set; }
        public int Animal { get; set; }
        public int Vacuna { get; set; }
        public DateTime Fecha { get; set; }
        public bool Listo { get; set; }
    }
}
