using Microsoft.EntityFrameworkCore;
using MiVet.Core.Interfaces;
using MiVet.Core.Services;
using MiVet.Infrastructure.Data;
using MiVet.Infrastructure.Filters;
using MiVet.Infrastructure.Repositories;
using MiVet.Infrastructure.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services
    .AddControllers(options => { options.Filters.Add<GlobalExceptionFilters>(); })
    .AddNewtonsoftJson(options => { options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore; })
    .ConfigureApiBehaviorOptions(options => { /*options.SuppressModelStateInvalidFilter = true; */});

builder.Services.AddDbContext<MiVetDBContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("MiVetDB")));

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

builder.Services.AddTransient<IServices, Services>();
builder.Services.AddScoped(typeof(IRepository<>), typeof(BaseRepository<>));
builder.Services.AddTransient<IUnitOfWork, UnitOfWork>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
