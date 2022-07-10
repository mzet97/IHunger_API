# IHunger_API

Food delivery API

## Technologies implemented

* Asp.Net Core
* Entity Framework Core
* Swagger
* Fluent Validation
* Identity
* Docker
* PostgreSQL
* MiniProfiler

## Architecture

* Layer architecture
* S.O.L.I.D. principles
* Clean Code
* Repository Pattern
* Unit of work Pattern
* Notification Pattern
* Domain Driven Design

## How to use it

To use the API, login is required.
On the route: /api/v1/auth/login

```
{
  "email": "user@example.com",
  "password": "string"
}
```

If you don't have login.
On the route: /api/v1/auth/register

```
{
  "email": "user@example.com",
  "password": "string",
  "confirmPassword": "string",
  "profile": {
    "name": "string",
    "lastName": "string",
    "birthDate": "2022-07-10T22:12:03.344Z",
    "type": 0
  },
  "address": {
    "street": "string",
    "district": "string",
    "city": "string",
    "county": "string",
    "zipCode": "string",
    "latitude": "string",
    "longitude": "string"
  }
}
```

### MiniProfiler

Routes to use:
/profiler/results-index
/profiler/results-list
/profiler/results
