use Mix.Config

# Configure your database
config :time_trapper, TimeTrapper.Repo,
  username: "postgres",
  password: "postgres",
  database: "time_trapper_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :time_trapper, TimeTrapperWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
