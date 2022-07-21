import Config

if Config.config_env() == :dev do
  DotenvParser.load_file(".env")
end

config :sqlt, ecto_repos: [SQLT.Repo]

config :sqlt, SQLT.Repo,
  env: Config.config_env(),
  database: System.fetch_env!("DATABASE_DATABASE"),
  username: System.fetch_env!("DATABASE_USERNAME"),
  password: System.fetch_env!("DATABASE_PASSWORD"),
  hostname: System.fetch_env!("DATABASE_HOSTNAME")
