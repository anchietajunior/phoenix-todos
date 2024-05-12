# Phoenix Todos with React

Manage todos with Elixir/Phoenix and React.

## How to run

Run docker compose

```shell
docker-compose up --build
```

It will setup the following containers:

- PostgreSQL - Port 5454 (to avoid conflict with 5432)
- Api with Phoenix - Port 4000
- React frontend - Port 3000

## Phoenix API

To run the tests, run this command inside the container:

```shell
mix tests 
```

The Phoenix API is using JWT with Guardian.

## React frontend

The React frontend is using Vite.
