using IHunger.WebAPI.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Configure logging
builder.Logging.AddFile("Logs/ihunger-api-{Date}.txt");

// Configure services
builder.Services.AddIdentityConfig(builder.Configuration);
builder.Services.AddAutoMapper(typeof(Program));
builder.Services.AddApiConfig();
builder.Services.AddSwaggerConfig();
builder.Services.ResolveDependencies();
builder.Services.AddHealthChecks();

var app = builder.Build();

// Configure middleware pipeline
app.UseApiConfig(app.Environment);
app.UseSwaggerConfig(app.Services.GetRequiredService<Asp.Versioning.ApiExplorer.IApiVersionDescriptionProvider>());

// Health check endpoints
app.MapHealthChecks("/health");

app.Run();

// Make Program accessible for integration tests
public partial class Program { }
