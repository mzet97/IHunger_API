# 🍔 IHunger API

Food delivery API built with .NET 10, Clean Architecture, and Docker.

## 🚀 Quick Start

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) with WSL2 backend
- [Git](https://git-scm.com/)

### Running with Docker (Recommended)

```bash
# Clone the repository
git clone https://github.com/your-user/IHunger_API.git
cd IHunger_API

# Start all services
docker compose up -d

# Or use the convenience script
./scripts/docker-up.sh
```

**That's it!** The API will be available at:
- 🌐 **API**: http://localhost:5000
- 📖 **Swagger**: http://localhost:5000/swagger
- ❤️ **Health Check**: http://localhost:5000/health

### Docker Profiles

```bash
# Basic (API + PostgreSQL)
docker compose up -d

# With pgAdmin (database management UI)
docker compose --profile tools up -d
# pgAdmin: http://localhost:5050

# With Redis (caching)
docker compose --profile cache up -d

# Everything
docker compose --profile tools --profile cache up -d
```

### Useful Scripts

```bash
./scripts/docker-up.sh [dev|tools|cache|all]  # Start services
./scripts/docker-down.sh [--volumes]           # Stop services
./scripts/docker-reset.sh                      # Full reset (rebuild)
```

## 🏗️ Architecture

```
IHunger/
├── 1 - Application/IHunger.WebAPI        → Presentation Layer (Controllers, Config)
├── 2 - Domain/IHunger.Domain             → Domain Layer (Models, Interfaces)
├── 3 - Service/IHunger.Service           → Service Layer (Business Logic)
├── 4 - Infra/
│   ├── 4.1 - Data/IHunger.Infra.Data     → Data Access (EF Core, Repositories)
│   └── 4.2 - CrossCutting/               → Shared (ViewModels, Filters, Extensions)
├── IHunger.Integration.Test              → Integration Tests
└── IHunger.Service.Test                  → Unit Tests
```

### Design Patterns
- **Layer Architecture** with Dependency Inversion
- **Repository Pattern** with generic base
- **Unit of Work** for transaction management
- **Notification Pattern** for domain errors
- **FluentValidation** for input validation
- **AutoMapper** for object mapping

## 🛠️ Technologies

| Technology | Version |
|------------|---------|
| .NET | 10.0 |
| Entity Framework Core | 10.0 |
| PostgreSQL | 16 |
| ASP.NET Core Identity | 10.0 |
| JWT Authentication | 10.0 |
| Swagger/OpenAPI | 7.x |
| FluentValidation | 11.x |
| AutoMapper | 13.x |
| Docker | Latest |

## 📡 API Endpoints

### Authentication
| Method | Route | Description |
|--------|-------|-------------|
| POST | `/api/v1/auth/register` | Register new user |
| POST | `/api/v1/auth/login` | Login and get JWT |

### Categories
| Method | Route | Description |
|--------|-------|-------------|
| GET | `/api/v1/category-products` | List all product categories |
| POST | `/api/v1/category-products` | Create product category |
| GET | `/api/v1/category-restaurants` | List all restaurant categories |
| POST | `/api/v1/category-restaurants` | Create restaurant category |

### Products
| Method | Route | Description |
|--------|-------|-------------|
| GET | `/api/v1/products` | List all products |
| GET | `/api/v1/products/{id}` | Get product by ID |
| POST | `/api/v1/products` | Create product |

### Restaurants
| Method | Route | Description |
|--------|-------|-------------|
| GET | `/api/v1/restaurants` | List all restaurants |
| GET | `/api/v1/restaurants/{id}` | Get restaurant by ID |
| POST | `/api/v1/restaurants` | Create restaurant |
| PUT | `/api/v1/restaurants/{id}` | Update restaurant |
| DELETE | `/api/v1/restaurants/{id}` | Delete restaurant |

### Orders
| Method | Route | Description |
|--------|-------|-------------|
| GET | `/api/v1/orders` | List orders (with filters) |
| GET | `/api/v1/orders/{id}` | Get order by ID |
| POST | `/api/v1/orders` | Create order |
| PUT | `/api/v1/orders/{id}` | Update order |
| PUT | `/api/v1/orders/{id}/status/{status}` | Update order status |
| DELETE | `/api/v1/orders/{id}` | Delete order |

### Coupons
| Method | Route | Description |
|--------|-------|-------------|
| GET | `/api/v1/coupons` | List all coupons |
| POST | `/api/v1/coupons` | Create coupon |
| PUT | `/api/v1/coupons/{id}` | Update coupon |
| DELETE | `/api/v1/coupons/{id}` | Delete coupon |

### Profile
| Method | Route | Description |
|--------|-------|-------------|
| GET | `/api/v1/profile` | Get current user profile |
| PUT | `/api/v1/profile` | Update current user profile |

## 🔐 Authentication

The API uses JWT Bearer authentication. To access protected endpoints:

1. Register a user via `POST /api/v1/auth/register`
2. Login via `POST /api/v1/auth/login` to get the JWT token
3. Add the token to requests: `Authorization: Bearer {your-token}`

### User Types and Claims
- **Admin**: Full access to all endpoints
- **Client**: Can manage orders, items, and view products/restaurants
- **Restaurant**: Can manage products, coupons, and restaurant data

## 🧪 Testing

```bash
# Run all tests
dotnet test

# Run with coverage
dotnet test /p:CollectCoverage=true

# Run specific test project
dotnet test IHunger/3\ -\ Service/IHunger.Service.Test/
```

## 🔧 Development

### Running locally (without Docker)

```bash
# Prerequisites: .NET 10 SDK, PostgreSQL

# Restore dependencies
dotnet restore IHunger/IHunger.sln

# Run the API
dotnet run --project IHunger/1\ -\ Application/IHunger.WebAPI/
```

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `ConnectionStrings__DefaultConnection` | PostgreSQL connection string | See appsettings |
| `AppSettings__Secret` | JWT signing secret | - |
| `AppSettings__Issuer` | JWT issuer | IHunger |
| `AppSettings__ValidOn` | JWT audience | http://localhost:5000 |
| `ASPNETCORE_ENVIRONMENT` | Environment name | Development |

### Database Migrations

```bash
# Create migration
dotnet ef migrations add MigrationName --project IHunger/4\ -\ Infra/4.1\ -\ Data/IHunger.Infra.Data --startup-project IHunger/1\ -\ Application/IHunger.WebAPI

# Apply migrations
dotnet ef database update --startup-project IHunger/1\ -\ Application/IHunger.WebAPI
```

## 📋 Health Checks

- **Endpoint**: `GET /health`
- **Returns**: 200 OK if healthy

## 📝 License

This project is licensed under the MIT License.

## 👥 Contributors

- **Matheus Zeitune** - [GitHub](https://github.com/mzet97)
