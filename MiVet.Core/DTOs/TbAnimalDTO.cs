namespace MiVet.Core.DTOs
{
    public class TbAnimalDTO
    {
        public int Id { get; set; }
        public int Raza { get; set; }
        public string? Apodo { get; set; }
        public DateTime Nacimiento { get; set; }
        public string? Peso { get; set; }
        public bool Genero { get; set; }
        public int Estado { get; set; }
    }
}
