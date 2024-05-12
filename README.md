# Phoenix Todos with React

Manage todos with Elixir/Phoenix and React.

## How to run

Make sure you don't have any other running containers exposing the following ports:

- 5454
- 4000
- 3000

Run docker compose

```shell
docker-compose up --build
```

It will setup the following containers:

- PostgreSQL - Port 5454 (to avoid conflict with 5432)
- Api with Phoenix - <a href="http://localhost:4000/api" target="_blank">Port 4000</a>
- React frontend - <a href="http://localhost:3000/" target="_blank">Port 3000</a>

## Sign in

There are two previous created users: 

- Email: user1@user.com | Senha: 123456
- Email: user2@user.com | Senha: 123456

## Phoenix API

To run the tests, run this command inside the container:

```shell
mix tests 
```

The Phoenix API is using JWT with Guardian.

## React frontend

The React frontend is using Vite.
