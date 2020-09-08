defmodule Greetings do
  use Plug.Router

  import Plug.Conn

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, :ok, "greetings user: #{conn.assigns.current_user}")
  end

  # for cases like /greetings/...
  match _ do
    send_resp(conn, :not_found, "")
  end
end
