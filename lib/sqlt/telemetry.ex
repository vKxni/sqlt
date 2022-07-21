defmodule SQLT.Telemetry do
  # use GenServer
  require Logger

  @moduledoc """
  
  Telemetry does not require a GenServer - added to the children spec (in application)
  by default: 

    - https://hexdocs.pm/elixir/1.12/GenServer.html

  Functions like "start_link" and "init" are implemented by the call "use Genserver" (line 2)
  If you want to start this, we have to add it to our application.ex (-sup) tag.

    children = [
      ...
      {SQLT.Telemetry, []}
    ] 
  """

  # And then start the GenServer within the module, you can also use %MODULE etc.

  # def start_link(state) do
  #   GenServer.start_link(__MODULE__, state, name: __MODULE__)
  # end

  # Of course initializing it ...

  # @impl true
  # def init(stack) do
  #   {:ok, stack}
  # end

  @doc """
  
  Here we initialize the execution for telemetry. 
  Remember this would be the same as for a web/phoenix application.

  ".execute" is the function we are calling here

  valid operations:
      - attach
      - detach
      - execute
      - list_handlers
      - module_info
      - report_cb
      - span 

  """

  def emit(value) do 
    :telemetry.execute([:sqlt, :emit], %{value: value})
  end
  
  @doc """
  
  Here we handle "main event" for the telemetry handler defined in the application.ex

    - :ok = :telemetry.attach("sqlt-repo-handler", [:sqlt, :repo, :query], &SQLT.Telemetry.handle_event/4, %{})

  Once some event is executed, we log it to the console and also write the content to a 
  separate file in our root directory. 

  We use the metadata variable with the query and params parameter, tho there are some more

    :type - the type of the Ecto query. For example, for Ecto.SQL databases, it would be :ecto_sql_query
    :repo - the Ecto repository
    :result - the query result
    :params - the query parameters
    :query - the query sent to the database as a string
    :source - the source the query was made on (may be nil)
    :options - extra options given to the repo operation under :telemetry_options

  """

  def handle_event([:sqlt, :repo, :query], measurements, metadata, _config) do
    data = "#{metadata.query} #{metadata.params}"

    Logger.info(data)
    File.write("raw.sql", data)
  end
end
