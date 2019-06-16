defmodule WorldOfPongWeb.PingController do
  use WorldOfPongWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"reply" => reply} = params) do
    render(conn, "show.html", reply: reply)
  end
end
