defmodule SQLT.People do
  use Ecto.Schema

  @moduledoc """
  Changesets allow filtering, casting, validation and definition of constraints when manipulating structs.

  There is an example of working with changesets in the introductory documentation in the Ecto module. 
  The functions cast/4 and change/2 are the usual entry points for creating changesets. 
  The first one is used to cast and validate external parameters, such as parameters sent through a 
  form, API, command line, etc. 
  The second one is used to change data directly from your application.

    - https://hexdocs.pm/ecto/Ecto.Changeset.html

  The remaining functions in this module, such as validations, constraints, 
  association handling, are about manipulating changesets. 
  """

  def changeset(person, params \\ %{}) do
    person
    # tell what parameters are allowed to be passted through 
    |> Ecto.Changeset.cast(params, [:first_name, :last_name, :age])
    # we expect values for fn + ln
    |> Ecto.Changeset.validate_required([:first_name, :last_name])
  end

  schema "people" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:age, :integer)
  end
end
