defmodule WorldOfPongWeb.PageController do
  use WorldOfPongWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
