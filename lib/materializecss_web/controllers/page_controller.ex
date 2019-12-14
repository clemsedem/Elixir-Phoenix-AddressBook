defmodule MaterializecssWeb.PageController do
  use MaterializecssWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
