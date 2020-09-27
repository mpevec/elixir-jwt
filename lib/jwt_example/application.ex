defmodule JwtExample.Application do
  use Application
  require Logger

  def start(_type, _args) do
    Logger.info("Starting application..")

    children = [
      {Plug.Cowboy,
       scheme: :http,
       plug: JwtExample.Router,
       options: [port: Application.fetch_env!(:jwt_example, :cowboy_port)]}
    ]

    opts = [strategy: :one_for_one, name: JwtExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
