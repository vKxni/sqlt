defmodule Mix.Tasks.Status do
    @moduledoc "Checks if your system is working."
    use Mix.Task

    @shortdoc "Determines if your application is working"
    def run(_) do
      # This will start our application
      Mix.Task.run("app.start")
      IO.inspect(System.cmd("whoami", []), label: "user")
      IO.inspect(System.build_info(), label: "system")
      Sqlt.status()
    end
  end