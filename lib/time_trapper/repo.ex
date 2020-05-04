defmodule TimeTrapper.Repo do
  use Ecto.Repo,
    otp_app: :time_trapper,
    adapter: Ecto.Adapters.Postgres
end
