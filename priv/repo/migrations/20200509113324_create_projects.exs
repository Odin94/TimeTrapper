defmodule TimeTrapper.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :roles, {:array, :string}

      timestamps()
    end

  end
end
