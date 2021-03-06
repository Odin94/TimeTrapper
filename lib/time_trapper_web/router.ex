defmodule TimeTrapperWeb.Router do
  use TimeTrapperWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimeTrapperWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/projects", ProjectController
    resources "/userprojects", UserProjectController
    resources "/entries", TimeEntryController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimeTrapperWeb do
  #   pipe_through :api
  # end
end
