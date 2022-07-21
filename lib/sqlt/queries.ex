defmodule Query do
  require Ecto.Query

  @behaviour Parser

  @moduledoc """

  These are a simple Ecto queries to insert, update, delete, purge data. 

    - https://hexdocs.pm/ecto_sql/Ecto.Migration.html

  We use a schema with three fields ...
  first_name and last_name requires a string, while
  ages type is an integer.

    - https://hexdocs.pm/ecto/Ecto.Schema.html

  While "person" is the variable, and Repo.<operation> is the function.
  We pass "person" as an argument / 1.

  """

  @doc """

  Here we insert data into the database, this is required, otherwise we cannot 
  show/update/delete them. 

  There are two cases

    - single
    - multi 
  cases.

  With the single case you have much more intellisense of what is going on
  behind the scenes. 

  Obviously the multi version is much faster, there you cannot control what is going on.
  """
  @impl Parser
  def insert do
    firstname = IO.gets("Enter the firstname: ") |> String.trim()
    lastname = IO.gets("Enter the lastname: ") |> String.trim()
    person = %SQLT.People{first_name: firstname, last_name: lastname, age: 25}
    SQLT.Repo.insert(person)
  end

  @impl Parser
  def multi_insert do
    data = [
      %SQLT.People{first_name: "Ryan", last_name: "Lole", age: 28},
      %SQLT.People{first_name: "John", last_name: "Smith", age: 27},
      %SQLT.People{first_name: "Jane", last_name: "Maggot", age: 26}
    ]

    Enum.each(data, fn data -> SQLT.Repo.insert(data) end)
  end

  @doc """

  Once we have data in our database, we notify a small, silly mistake.

  We don't want to delete the user and insert him again, this might lead to some 
  security issues. Instead, we update the user with the "update" function. 

    iex> people = SQLT.People |> Ecto.Query.first |> SQLT.Repo

  Would work too, but since we want to find an unique user, we have to either use
  his first or lastname. Do not use the "age" field as it could overlap with some other users.
  """

  def edit do
    name = IO.gets("Enter the first_name that you want to find: ") |> String.trim()
    newname = IO.gets("Now enter the new first_name: ") |> String.trim()
    person = SQLT.People |> Ecto.Query.where(first_name: ^name) |> SQLT.Repo.one()
    changeset = SQLT.People.changeset(person, %{first_name: newname})

    case SQLT.Repo.update(changeset) do
      {:ok, person} ->
        IO.puts("Updated #{person}")

      {:error, error} ->
        IO.puts("Error #{error}")
    end
  end

  @doc """

  Since we are able to insert and even edit data, we also would like to get rid of some 
  data (that we don't need anymore).

  Here we also fetch the user by his "firstname" - query through all the Repos data,
  and then delete the persons data. 

    - first_name
    - last_name
    - age
    - (id) 

  will be deleted. 
  Make sure to create backups in production.
  """

  def delete do
    name = IO.gets("Enter the first_name: ") |> String.trim()
    person = SQLT.People |> Ecto.Query.where(first_name: ^name) |> SQLT.Repo.one()
    SQLT.Repo.delete(person)
  end

  @doc """
  Purging data, but keep something in mind. 

  If we have a lot of traffic on our database, means a lot of data ... a lot of users,
  then deleting them one by one is a huge pain and takes a lot of time.

  Instead, if we want to wipe/purge/clean all the data at once, we can use
  the "delete_all()" function.

  However, if you still need one or two users data, this won't be ignored,
  everything will be deleted 
  """

  def purge do
    SQLT.People |> SQLT.Repo.delete_all()
  end

  @doc """

  Sometimes we want to see what is going on in our database. 
  We want to lookup all of our trafic and what data is being saved.

  Fortunately, we have the ".all()" function that returns all of our data
  into our console, perfect for some small use cases.
  """
  def all do
    SQLT.People |> SQLT.Repo.all()
  end
end
