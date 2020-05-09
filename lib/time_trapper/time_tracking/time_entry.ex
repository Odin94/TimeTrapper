defmodule TimeTrapper.TimeTracking.TimeEntry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "time_entries" do
    field :date, :date
    field :minutes, :integer
    field :submitted, :boolean, default: false
    field :user_id, :id
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(time_entry, attrs) do
    time_entry
    |> cast(attrs, [:date, :minutes, :submitted])
    |> validate_required([:date, :minutes, :submitted])
  end
end
