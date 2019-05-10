defmodule WorldOfPong.Repo do
  use Ecto.Repo,
    otp_app: :world_of_pong,
    adapter: Ecto.Adapters.Postgres
end
