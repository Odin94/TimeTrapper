defmodule TimeTrapper.Repo.Migrations.CreateTimeEntries do
  use Ecto.Migration

  def change do
    create table(:time_entries) do
      add :date, :date
      add :minutes, :integer
      add :submitted, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:time_entries, [:user_id])
    create index(:time_entries, [:project_id])
  end
end
