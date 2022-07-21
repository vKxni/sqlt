defmodule SQLT.Repo do
  use Ecto.Repo,
    otp_app: :sqlt,
    adapter: Ecto.Adapters.Postgres
end
