defmodule WorldOfPongWeb.Router do
  use WorldOfPongWeb, :router

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

  scope "/", WorldOfPongWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/ping", PingController, :index
    get "/ping/:reply", PingController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", WorldOfPongWeb do
  #   pipe_through :api
  # end
end
