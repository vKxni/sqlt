defmodule Sqlt.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    :ok = :telemetry.attach("sqlt-repo-handler", [:sqlt, :repo, :query], &SQLT.Telemetry.handle_event/4, %{})
    
    children = [
      {SQLT.Repo, []},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sqlt.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
