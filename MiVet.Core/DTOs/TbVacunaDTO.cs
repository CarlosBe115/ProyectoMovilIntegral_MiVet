namespace MiVet.Core.DTOs
{
    public class TbVacunaDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Tipo { get; set; }
        public string? Via { get; set; }
        public string Momento { get; set; } = null!;
        public bool NecesitaRefuerzo { get; set; }
        public string? PeridoRefuerzo { get; set; }
    }
}
