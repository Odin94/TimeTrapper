defmodule TimeTrapper.Entities.UserProject do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_projects" do
    field :user_id, :id
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(user_project, attrs) do
    user_project
    |> cast(attrs, [])
    |> validate_required([])
  end
end
