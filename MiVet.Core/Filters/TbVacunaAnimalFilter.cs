namespace MiVet.Core.Filters
{
    public class TbVacunaAnimalFilter
    {
        public int? Id { get; set; }
        public int? Animal { get; set; }
        public int? Vacuna { get; set; }
        public int? Veterinario { get; set; }
        public string? Evidencia { get; set; }
        public DateTime? FechaAplicacion { get; set; }
        public bool? Listo { get; set; }
    }
}
