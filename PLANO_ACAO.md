# 🚀 PLANO DE AÇÃO - IHunger API

## Objetivo
Corrigir todos os bugs, implementar componentes vazios, atualizar para .NET 10, e configurar Docker + Docker Compose para WSL.

---

## 📊 Resumo de Escopo

| Item | Quantidade |
|------|-----------|
| 🔴 Bugs Críticos | 7 |
| 🟠 Componentes Vazios | 6 |
| 🟡 Problemas Alta Prioridade | 5 |
| 🟤 Problemas Médios | 7 |
| 🐳 Docker/Infra | 3 |
| ⬆️ Upgrade .NET 10 | 8 projetos |
| **Total de tarefas** | **~60** |

---

## FASE 0 — Preparação e Infraestrutura (Docker + WSL)
**Objetivo:** Criar ambiente Docker funcional ANTES de tocar no código

### 0.1 — Criar `docker-compose.yml` na raiz do repositório
- [ ] PostgreSQL 16 com volume persistente
- [ ] pgAdmin 4 para gerenciamento visual
- [ ] Rede interna entre containers
- [ ] Health check no PostgreSQL
- [ ] Variáveis de ambiente (não hardcoded)

### 0.2 — Atualizar Dockerfile para .NET 10
- [ ] Base image: `mcr.microsoft.com/dotnet/aspnet:10.0`
- [ ] Build image: `mcr.microsoft.com/dotnet/sdk:10.0`
- [ ] Multi-stage build otimizado
- [ ] Expor porta 5000 (HTTP) e 5001 (HTTPS)

### 0.3 — Criar `.dockerignore` atualizado
- [ ] Excluir `bin/`, `obj/`, `.vs/`, `.git/`, `Logs/`, `*.user`

### 0.4 — Criar `docker-compose.override.yml` para desenvolvimento
- [ ] Hot-reload com volume mount do código
- [ ] Variáveis de ambiente de desenvolvimento
- [ ] Portas mapeadas para host

### 0.5 — Criar `appsettings.Docker.json`
- [ ] Connection string apontando para `host.docker.internal` ou nome do serviço PostgreSQL
- [ ] JWT Secret via variável de ambiente
- [ ] Desabilitar `EnableSensitiveDataLogging`
- [ ] Desabilitar `LogTo(Console.WriteLine)`

---

## FASE 1 — Upgrade para .NET 10
**Objetivo:** Migrar todos os 8 projetos de `net6.0` para `net10.0`

### 1.1 — Criar `Directory.Build.props` na raiz da solution
- [ ] Centralizar `<TargetFramework>net10.0</TargetFramework>`
- [ ] Centralizar `<ImplicitUsings>enable</ImplicitUsings>`
- [ ] Centralizar `<Nullable>enable</Nullable>`
- [ ] Configurações globais de análise de código

### 1.2 — Criar `Directory.Packages.props` (Central Package Management)
- [ ] Habilitar `<ManagePackageVersionsCentrally>true</ManagePackageVersionsCentrally>`
- [ ] Migrar TODAS as versões de pacotes dos .csproj para este arquivo
- [ ] Eliminar versões duplicadas/inconsistentes

### 1.3 — Atualizar pacotes NuGet para .NET 10

| Pacote Atual | Versão Atual | Pacote Novo | Versão Nova |
|---|---|---|---|
| Microsoft.EntityFrameworkCore | 6.0.1 | Microsoft.EntityFrameworkCore | 10.0.x |
| Microsoft.EntityFrameworkCore.Design | 6.0.1 | Microsoft.EntityFrameworkCore.Design | 10.0.x |
| Microsoft.EntityFrameworkCore.Relational | 6.0.1 | Microsoft.EntityFrameworkCore.Relational | 10.0.x |
| Microsoft.EntityFrameworkCore.Proxies | 6.0.1 | Microsoft.EntityFrameworkCore.Proxies | 10.0.x |
| Microsoft.EntityFrameworkCore.Tools | 6.0.1 | Microsoft.EntityFrameworkCore.Tools | 10.0.x |
| Microsoft.EntityFrameworkCore.InMemory | 6.0.7 | Microsoft.EntityFrameworkCore.InMemory | 10.0.x |
| Npgsql.EntityFrameworkCore.PostgreSQL | 6.0.2 | Npgsql.EntityFrameworkCore.PostgreSQL | 10.0.x |
| Microsoft.AspNetCore.Identity.EntityFrameworkCore | 6.0.1 | (incluído no framework) | — |
| Microsoft.AspNetCore.Identity.UI | 6.0.1 | (incluído no framework) | — |
| Microsoft.AspNetCore.Authentication.JwtBearer | 6.0.1 | (incluído no framework) | — |
| Microsoft.AspNetCore.Mvc.NewtonsoftJson | 6.0.1 | (incluído no framework) | — |
| Microsoft.AspNetCore.Mvc.Versioning | 5.0.0 | (remover — usar built-in) | — |
| Microsoft.AspNetCore.Mvc.Versioning.ApiExplorer | 5.0.0 | (remover — usar built-in) | — |
| Microsoft.AspNetCore.TestHost | 6.0.7 | (incluído no framework) | — |
| AutoMapper.Extensions.Microsoft.DependencyInjection | 11.0.0 | AutoMapper | 13.0.x |
| Swashbuckle.AspNetCore | 6.2.3 | Swashbuckle.AspNetCore | 7.x ou Microsoft.AspNetCore.OpenApi |
| FluentValidation | 10.3.6 | FluentValidation | 11.x |
| LinqKit | 1.1.27 | LinqKit | 1.2.x |
| MiniProfiler.AspNetCore.Mvc | 4.2.22 | MiniProfiler.AspNetCore.Mvc | 4.4.x |
| MiniProfiler.EntityFrameworkCore | 4.2.22 | MiniProfiler.EntityFrameworkCore | 4.4.x |
| Moq | 4.18.1 | Moq | 4.20.x ou NSubstitute |
| xunit | 2.4.1 | xunit | 2.9.x |
| xunit.runner.visualstudio | 2.4.3 | xunit.runner.visualstudio | 2.8.x |
| Microsoft.NET.Test.Sdk | 16.11.0 | Microsoft.NET.Test.Sdk | 17.x |
| coverlet.collector | 3.1.0 | coverlet.collector | 6.x |
| NodaTime | 3.0.9 | NodaTime | 3.1.x |
| Serilog.Extensions.Logging.File | 2.0.0 | Serilog.Extensions.Logging.File | 3.0.x |
| Newtonsoft.Json | 13.0.1 | Newtonsoft.Json | 13.0.x |
| Faker.NETCore | 1.0.2 | Bogus | 35.x |

### 1.4 — Converter Program.cs para Minimal Hosting Model
- [ ] Substituir `Host.CreateDefaultBuilder` por `WebApplication.CreateBuilder`
- [ ] Remover `Startup.cs` — mover configuração para `Program.cs` ou manter extension methods
- [ ] Configurar logging Serilog/Console no novo padrão

### 1.5 — Converter Startup.cs para extension methods
- [ ] Manter `IdentityConfig.AddIdentityConfig()`
- [ ] Manter `ApiConfig.AddApiConfig()` / `UseApiConfig()`
- [ ] Manter `SwaggerConfig.AddSwaggerConfig()` / `UseSwaggerConfig()`
- [ ] Manter `DependencyInjectionConfig.ResolveDependencies()`
- [ ] Atualizar chamadas para o novo padrão `builder.Services` / `app`

### 1.6 — Atualizar API Versioning para built-in
- [ ] Remover `Microsoft.AspNetCore.Mvc.Versioning` (community package)
- [ ] Implementar `Asp.Versioning.Mvc` (pacote oficial do .NET 10)
- [ ] Atualizar controllers com `[ApiVersion("1.0")]`
- [ ] Atualizar Swagger para suportar versionamento nativo

### 1.7 — Atualizar AutoMapper
- [ ] Substituir `AutoMapper.Extensions.Microsoft.DependencyInjection` por `AutoMapper` 13.x
- [ ] Atualizar `AddAutoMapper()` para novo padrão: `builder.Services.AddAutoMapper(typeof(Program))`

### 1.8 — Atualizar Swagger/OpenAPI
- [ ] Avaliar: Swashbuckle 7.x ou `Microsoft.AspNetCore.OpenApi`
- [ ] Atualizar configuração JWT no Swagger
- [ ] Garantir que Swagger funciona com versionamento de API

### 1.9 — Build e correção de erros de compilação
- [ ] `dotnet build` — corrigir TODOS os erros de breaking changes
- [ ] APIs removidas/renomeadas entre .NET 6 e .NET 10
- [ ] Nullable reference warnings (se habilitado)

---

## FASE 2 — Correção de Bugs Críticos
**Objetivo:** Corrigir os 7 bugs que impedem o funcionamento correto

### 2.1 — CouponService.Update — self-comparison bug
- [ ] `CouponService.cs:81-94` — trocar `couponDb.X != couponDb.X` por `couponDb.X != coupon.X`
- [ ] Testar: atualização de Code, ExpireAt, Value

### 2.2 — CouponController — wrong claims
- [ ] `CouponController.cs` — trocar `"CategoryProduct"` por `"Coupon"` em todos os `[ClaimsAuthorize]`

### 2.3 — OrderController — wrong claims
- [ ] `OrderController.cs:69` — trocar `"Restaurant"` por `"Order"` no Update
- [ ] `OrderController.cs:83` — trocar `"Restaurant"` por `"Order"` no Delete

### 2.4 — AuthService.Register — JWT on failure
- [ ] `AuthService.cs:48-61` — adicionar `if (!result.Succeeded) return null;` ou retornar erro
- [ ] Garantir que notificações são adicionadas ao Notifier

### 2.5 — Filtro CreatedAt filtra por Id
- [ ] `OrderService.cs:145-153` — trocar `x.Id == orderFilter.Id` por `x.CreatedAt == orderFilter.CreatedAt`
- [ ] `CategoryProductService.cs:121` — mesma correção
- [ ] `RestaurantService.cs:149` — mesma correção
- [ ] `ProductService.cs:160` — mesma correção

### 2.6 — OrderService.Update — NotImplementedException
- [ ] `OrderService.cs:190` — implementar o método Update completo
- [ ] Seguir padrão dos outros services (validação, notificação, commit)

### 2.7 — OrderController — stub endpoints
- [ ] `UpdateStatus` — implementar busca de Order + atualização do Status
- [ ] `CreateUpdateItem` — implementar adição/atualização de Item no Order
- [ ] `DeleteItem` — implementar remoção de Item do Order

---

## FASE 3 — Implementação de Componentes Vazios
**Objetivo:** Deixar todos os services e controllers funcionais

### 3.1 — IUserService / UserService
- [ ] Definir interface: `GetById`, `GetByEmail`, `Update`, `Delete`
- [ ] Implementar service com validação e notificações
- [ ] Criar UserViewModel (se não existir)
- [ ] Criar UserValidator (FluentValidation)

### 3.2 — IItemService / ItemService
- [ ] Definir interface: `GetById`, `GetAll`, `GetByOrder`, `Create`, `Update`, `Delete`
- [ ] Implementar service seguindo padrão dos outros services
- [ ] Criar ItemViewModel e ItemValidator

### 3.3 — IAddressRestaurantService / AddressRestaurantService
- [ ] Definir interface: `GetById`, `GetByRestaurant`, `Create`, `Update`, `Delete`
- [ ] Implementar service
- [ ] Criar AddressRestaurantViewModel e AddressRestaurantValidator

### 3.4 — IAddressUserService / AddressUserService
- [ ] Definir interface: `GetById`, `GetByUser`, `Create`, `Update`, `Delete`
- [ ] Implementar service
- [ ] Criar AddressUserViewModel e AddressUserValidator

### 3.5 — ProfileController
- [ ] Implementar endpoints: GET (perfil do usuário logado), PUT (atualizar perfil)
- [ ] Injetar IUserService e IAspNetUser
- [ ] Usar ClaimsAuthorize corretas

### 3.6 — Verificar integração de DI
- [ ] Garantir que TODOS os novos services estão registrados em `DependencyInjectionConfig`
- [ ] Garantir que TODOS os novos repositórios estão registrados

---

## FASE 4 — Correções de Alta Prioridade
**Objetivo:** Resolver problemas de segurança e estabilidade

### 4.1 — Repository.Search — pagination bug
- [ ] `Repository.cs:63-107` — corrigir lógica de paginação
- [ ] Garantir `OrderBy` + `Skip` + `Take` corretos
- [ ] Tratar caso `pageIndex` null/0
- [ ] Remover `Count` do construtor (lazy load)

### 4.2 — ExceptionMiddleware — response body
- [ ] `ExceptionMiddleware.cs` — escrever JSON no response body com mensagem de erro
- [ ] Incluir stack trace apenas em Development

### 4.3 — EnableSensitiveDataLogging
- [ ] `IdentityConfig.cs:33` — remover `EnableSensitiveDataLogging(true)` ou condicionar a Development

### 4.4 — LogTo(Console.WriteLine)
- [ ] `DataIdentityDbContext.cs:37` — remover `LogTo(Console.WriteLine)` ou condicionar a Development

### 4.5 — UnitOfWork/RepositoryFactory — código morto
- [ ] Decidir: remover OU integrar corretamente
- [ ] Se remover: limpar DI registration
- [ ] Se integrar: refatorar services para usar UnitOfWork

---

## FASE 5 — Correções de Média Prioridade
**Objetivo:** Melhorar qualidade e consistência do código

### 5.1 — Domain → CrossCutting reference
- [ ] `IHunger.Domain.csproj` — remover referência desnecessária a CrossCutting
- [ ] Verificar se algum arquivo do Domain usa CrossCutting

### 5.2 — SignInManager no Register
- [ ] `AuthService.cs:51` — remover `SignInManager.SignInAsync` (desnecessário para API)

### 5.3 — Typos em mensagens de erro
- [ ] Corrigir "Not fround" → "Not found" em todos os services
- [ ] Corrigir "Error deleting entity" em métodos Update
- [ ] Corrigir "Error deleteing entity" (se existir)

### 5.4 — Nomes de propriedades
- [ ] `Comment.Starts` → `Comment.Stars` (+ migration)
- [ ] `Product.Itens` → `Product.Items` (+ migration)
- [ ] `Coupon.ative` → `Coupon.Active` (+ migration)
- [ ] Atualizar todos os ViewModels, Mappings, Controllers referenciados

### 5.5 — Email confirmation bypass
- [ ] `RegisterUserViewModel.ToDomain()` — não setar `EmailConfirmed = true` automaticamente
- [ ] Ou implementar fluxo real de confirmação de email

### 5.6 — Seeds
- [ ] Implementar dados seed em `Seeds/` (ex: categorias padrão, admin user)
- [ ] Chamar seed no `Program.cs` via `scope.ServiceProvider`

### 5.7 — Connection strings hardcoded
- [ ] Mover secrets para `dotnet user-secrets` em desenvolvimento
- [ ] Usar variáveis de ambiente em Docker/produção
- [ ] `appsettings.json` base com apenas valores não-sensíveis

---

## FASE 6 — Testes
**Objetivo:** Cobertura mínima aceitável para todos os services

### 6.1 — Unit Tests — Services
- [ ] `AuthServiceTest` — Register (success + failure), Login
- [ ] `CategoryProductServiceTest` — CRUD completo (expandir existente)
- [ ] `CategoryRestaurantServiceTest` — CRUD completo
- [ ] `CouponServiceTest` — CRUD completo (especialmente Update após fix)
- [ ] `OrderServiceTest` — CRUD + UpdateStatus + Items
- [ ] `ProductServiceTest` — CRUD completo
- [ ] `RestaurantServiceTest` — CRUD completo
- [ ] `CommentServiceTest` — CRUD completo
- [ ] `UserServiceTest` — CRUD completo
- [ ] `ItemServiceTest` — CRUD completo
- [ ] `AddressRestaurantServiceTest` — CRUD completo
- [ ] `AddressUserServiceTest` — CRUD completo

### 6.2 — Unit Tests — Repository
- [ ] Testar `Repository.Search` com paginação
- [ ] Testar includes em repositórios especializados

### 6.3 — Integration Tests
- [ ] `AuthControllerTest` — Register + Login (expandir existente)
- [ ] `CategoryProductControllerTest` — CRUD completo (expandir existente)
- [ ] `CategoryRestaurantControllerTest` — CRUD completo
- [ ] `CouponControllerTest` — CRUD completo
- [ ] `OrderControllerTest` — CRUD + Status + Items
- [ ] `ProductControllerTest` — CRUD completo
- [ ] `RestaurantControllerTest` — CRUD + Comments + Products
- [ ] `ProfileControllerTest` — GET + PUT

### 6.4 — Configurar CI-ready test execution
- [ ] `dotnet test` deve passar 100%
- [ ] Configurar cobertura de código com Coverlet

---

## FASE 7 — Docker Compose Final e Documentação
**Objetivo:** Experiência de desenvolvimento one-command

### 7.1 — docker-compose.yml final
```yaml
Serviços:
  - postgres: PostgreSQL 16 + volume + healthcheck
  - pgadmin: pgAdmin 4 (opcional, via profile)
  - api: IHunger API (.NET 10) + depends_on postgres
  - redis: Redis para cache (opcional, via profile)
```

### 7.2 — Scripts de conveniência
- [ ] `scripts/docker-up.sh` — sobe tudo com migrations automáticas
- [ ] `scripts/docker-down.sh` — para e limpa
- [ ] `scripts/docker-reset.sh` — reset completo (volume + rebuild)

### 7.3 — Health Checks na API
- [ ] Endpoint `/health` — verifica conexão com PostgreSQL
- [ ] Endpoint `/health/ready` — verifica se API está pronta
- [ ] Configurar health check no docker-compose para a API

### 7.4 — Documentação
- [ ] Atualizar `README.md` com:
  - Pré-requisitos (Docker Desktop + WSL2)
  - Como subir com `docker compose up`
  - Como rodar migrations
  - Como rodar testes
  - Variáveis de ambiente disponíveis
  - Arquitetura do projeto

### 7.5 — EF Core Migrations em Docker
- [ ] Criar entrypoint script que roda `dotnet ef database update` antes de iniciar a API
- [ ] Ou usar `IHost.MigrateDbContext<T>()` pattern no Program.cs

---

## 📋 ORDEM DE EXECUÇÃO RECOMENDADA

```
FASE 0 (Docker infra)     ──→  FASE 1 (.NET 10 upgrade)  ──→  FASE 9 (Build fix)
         │                                                        │
         ▼                                                        ▼
FASE 2 (Bugs críticos)    ──→  FASE 3 (Componentes vazios)
         │
         ▼
FASE 4 (Alta prioridade)  ──→  FASE 5 (Média prioridade)
         │
         ▼
FASE 6 (Testes)           ──→  FASE 7 (Docker final + Docs)
```

**Estimativa total: ~60 tarefas distribuídas em 7-8 fases**

---

## ⚠️ RISCOS E MITIGAÇÕES

| Risco | Mitigação |
|-------|-----------|
| Breaking changes .NET 6→10 | Compilar a cada fase, corrigir incrementalmente |
| EF Core migration compatibility | Recriar migrations se necessário (dev only) |
| AutoMapper API changes | Usar `Profile` base class, testar mapeamentos |
| API Versioning migration | Seguir guia oficial Asp.Versioning |
| PostgreSQL version no Docker | Usar imagem oficial postgres:16-alpine |

---

## 🎯 DEFINIÇÃO DE "DONE"

- [ ] `dotnet build` — zero erros, zero warnings
- [ ] `dotnet test` — 100% passando
- [ ] `docker compose up` — API + PostgreSQL sobem e funcionam
- [ ] Swagger acessível em `http://localhost:5000/swagger`
- [ ] Todos os endpoints funcionais (Auth, CRUD completo)
- [ ] Nenhum `NotImplementedException`
- [ ] Nenhum componente vazio
- [ ] Testes unitários para todos os services
- [ ] README atualizado
