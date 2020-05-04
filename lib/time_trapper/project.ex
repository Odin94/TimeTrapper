defmodule TimeTrapper.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    field :roles, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :roles])
    |> validate_required([:name, :roles])
  end
end
