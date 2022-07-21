defmodule SQLT.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias SQLT.Repo

      import Ecto
      import Ecto.Query
      import SQLT.RepoCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(SQLT.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(SQLT.Repo, {:shared, self()})
    end

    :ok
  end
end
