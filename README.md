# TimeTrapper
A modern, lightweight and simple time tracking web application written with Elixir/Phoenix.



# Default Phoenix Readme

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix



mix phx.gen.schema User users name 
mix phx.gen.schema Project projects name roles:array:string
mix phx.gen.schema TimeEntry time_entries date:date minutes:integer submitted:boolean user_id:references:users project_id:references:projects --table time_entries
mix phx.gen.schema UserProject user_projects user_id:references:users project_id:references:projects

