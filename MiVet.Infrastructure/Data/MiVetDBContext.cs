using Microsoft.EntityFrameworkCore;
using MiVet.Core.Entities;

namespace MiVet.Infrastructure.Data
{
    public partial class MiVetDBContext : DbContext
    {
        public MiVetDBContext() {}

        public MiVetDBContext(DbContextOptions<MiVetDBContext> options) : base(options) {}

        public virtual DbSet<TbAnimal> TbAnimals { get; set; } = null!;
        public virtual DbSet<TbEspecie> TbEspecies { get; set; } = null!;
        public virtual DbSet<TbEstado> TbEstados { get; set; } = null!;
        public virtual DbSet<TbPadre> TbPadres { get; set; } = null!;
        public virtual DbSet<TbPata> TbPatas { get; set; } = null!;
        public virtual DbSet<TbRaza> TbRazas { get; set; } = null!;
        public virtual DbSet<TbVacuna> TbVacunas { get; set; } = null!;
        public virtual DbSet<TbVacunaAnimal> TbVacunaAnimals { get; set; } = null!;
        public virtual DbSet<TbVeterinario> TbVeterinarios { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TbAnimal>(entity =>
            {
                entity.ToTable("tbAnimal");

                entity.Property(e => e.Apodo)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Nacimiento).HasColumnType("datetime");

                entity.Property(e => e.Peso)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.HasOne(d => d.EstadoNavigation)
                    .WithMany(p => p.TbAnimals)
                    .HasForeignKey(d => d.Estado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbAnimal_tbEstado");

                entity.HasOne(d => d.RazaNavigation)
                    .WithMany(p => p.TbAnimals)
                    .HasForeignKey(d => d.Raza)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbAnimal_tbRaza");
            });

            modelBuilder.Entity<TbEspecie>(entity =>
            {
                entity.ToTable("tbEspecie");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TbEstado>(entity =>
            {
                entity.ToTable("tbEstado");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TbPadre>(entity =>
            {
                entity.ToTable("tbPadres");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.MadreNavigation)
                    .WithMany(p => p.TbPadreMadreNavigations)
                    .HasForeignKey(d => d.Madre)
                    .HasConstraintName("FK_tbPadres_tbAnimal_M");

                entity.HasOne(d => d.PadreNavigation)
                    .WithMany(p => p.TbPadrePadreNavigations)
                    .HasForeignKey(d => d.Padre)
                    .HasConstraintName("FK_tbPadres_tbAnimal_P");
            });

            modelBuilder.Entity<TbPata>(entity =>
            {
                entity.ToTable("tbPatas");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Lcentro).HasColumnName("LCentro");

                entity.Property(e => e.Lderecha).HasColumnName("LDerecha");

                entity.Property(e => e.Lizquierda).HasColumnName("LIzquierda");

                entity.Property(e => e.Rcentro).HasColumnName("RCentro");

                entity.Property(e => e.Rderecha).HasColumnName("RDerecha");

                entity.Property(e => e.Rizquierda).HasColumnName("RIzquierda");

                entity.HasOne(d => d.IdNavigation)
                    .WithOne(p => p.TbPata)
                    .HasForeignKey<TbPata>(d => d.Id)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbPatas_tbAnimal");
            });

            modelBuilder.Entity<TbRaza>(entity =>
            {
                entity.ToTable("tbRaza");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.EspecieNavigation)
                    .WithMany(p => p.TbRazas)
                    .HasForeignKey(d => d.Especie)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbRaza_tbEspecie");
            });

            modelBuilder.Entity<TbVacuna>(entity =>
            {
                entity.ToTable("tbVacuna");

                entity.Property(e => e.Momento)
                    .HasMaxLength(75)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .HasMaxLength(75)
                    .IsUnicode(false);

                entity.Property(e => e.PeridoRefuerzo)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Tipo)
                    .HasMaxLength(150)
                    .IsUnicode(false);

                entity.Property(e => e.Via)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TbVacunaAnimal>(entity =>
            {
                entity.ToTable("tbVacunaAnimal");

                entity.Property(e => e.Fecha).HasColumnType("datetime");

                entity.HasOne(d => d.AnimalNavigation)
                    .WithMany(p => p.TbVacunaAnimals)
                    .HasForeignKey(d => d.Animal)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbVacunaAnimal_tbAnimal");

                entity.HasOne(d => d.VacunaNavigation)
                    .WithMany(p => p.TbVacunaAnimals)
                    .HasForeignKey(d => d.Vacuna)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tbVacunaAnimal_tbVacuna");
            });

            modelBuilder.Entity<TbVeterinario>(entity =>
            {
                entity.ToTable("tbVeterinario");

                entity.Property(e => e.Correo)
                    .HasMaxLength(125)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .HasMaxLength(125)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono)
                    .HasMaxLength(20)
                    .IsUnicode(false);
            });

        }

    }
}
