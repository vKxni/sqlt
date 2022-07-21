defmodule SQLT.Repo.Migrations.People do
  use Ecto.Migration

  def change do
    create table(:people) do 
      add :first_name, :string
      add :last_name, :string
      add :age, :integer
    end
  end
end
