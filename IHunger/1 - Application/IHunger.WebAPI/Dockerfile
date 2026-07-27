# ============================================
# IHunger API - Dockerfile (.NET 10)
# Multi-stage build for optimized production image
# ============================================

# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Copy csproj files and restore (layer caching)
COPY ["1 - Application/IHunger.WebAPI/IHunger.WebAPI.csproj", "1 - Application/IHunger.WebAPI/"]
COPY ["2 - Domain/IHunger.Domain/IHunger.Domain.csproj", "2 - Domain/IHunger.Domain/"]
COPY ["3 - Service/IHunger.Service/IHunger.Service.csproj", "3 - Service/IHunger.Service/"]
COPY ["4 - Infra/4.1 - Data/IHunger.Infra.Data/IHunger.Infra.Data.csproj", "4 - Infra/4.1 - Data/IHunger.Infra.Data/"]
COPY ["4 - Infra/4.2 - CrossCutting/IHunger.Infra.CrossCutting/IHunger.Infra.CrossCutting.csproj", "4 - Infra/4.2 - CrossCutting/IHunger.Infra.CrossCutting/"]

RUN dotnet restore "1 - Application/IHunger.WebAPI/IHunger.WebAPI.csproj"

# Copy everything and build
COPY . .
WORKDIR "/src/1 - Application/IHunger.WebAPI"
RUN dotnet build "IHunger.WebAPI.csproj" -c Release -o /app/build --no-restore

# Stage 2: Publish
FROM build AS publish
RUN dotnet publish "IHunger.WebAPI.csproj" -c Release -o /app/publish --no-restore /p:UseAppHost=false

# Stage 3: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

# Install curl for health checks
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy published output
COPY --from=publish /app/publish .

# Expose HTTP port
EXPOSE 5000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:5000/health || exit 1

ENTRYPOINT ["dotnet", "IHunger.WebAPI.dll"]
