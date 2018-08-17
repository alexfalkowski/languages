# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :todo, Todo.Ecto.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "todo",
  hostname: "localhost"

config :todo, ecto_repos: [Todo.Ecto.Repo]
