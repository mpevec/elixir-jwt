defmodule JwtExample.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
       scheme: :http,
       plug: JwtExample.Router,
       options: [port: Application.get_env(:jwt_example, :cowboy_port)]}
    ]

    opts = [strategy: :one_for_one, name: JwtExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
