defmodule JwtExample.Router do
  use Plug.Router

  if Mix.env() == :dev do
    use Plug.Debugger
  end

  import Plug.Conn

  forward("/greetings", to: Greetings)
  forward("/login", to: Login)

  plug(Plug.Logger, log: :debug)
  plug(:match)
  plug(JwtExample.Plug.Auth, public_path: "/login")

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  match _ do
    send_resp(conn, :not_found, "")
  end
end
