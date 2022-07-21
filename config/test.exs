use Mix.Config

config :sqlt, SQLT.Repo,
  database: "test_db",
  username: "postgres",
  password: "admin",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
