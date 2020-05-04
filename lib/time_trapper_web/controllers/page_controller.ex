defmodule TimeTrapperWeb.PageController do
  use TimeTrapperWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
