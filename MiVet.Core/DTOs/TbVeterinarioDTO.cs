namespace MiVet.Core.DTOs
{
    public class TbVeterinarioDTO
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = null!;
        public string? Telefono { get; set; }
        public string? Correo { get; set; }
    }
}
