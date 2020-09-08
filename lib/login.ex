defmodule Login do
  use Plug.Router

  import Plug.Conn

  alias JwtExample.Domain.User
  alias JwtExample.Jwt

  # Altough we can have only one pipeline in app (defined in router.ex), we ALWAYS need to have those two plugs defined when using Plug.Router
  plug(:match)
  plug(:dispatch)

  post "/" do
    {status, body} =
      case conn.body_params do
        %{"email" => email, "password" => password} -> prepare_response_with_jwt(email, password)
        _ -> {:bad_request, ''}
      end

    send_resp(conn, status, body)
  end

  def prepare_response_with_jwt(email, password) do
    with {:ok, user} <- User.get_user(email, password),
         jwt <- Jwt.create(user) do
      {:ok, jwt}
    else
      {:error, msg} -> {:unauthorized, msg}
    end
  end

  # for cases like /login/...
  match _ do
    send_resp(conn, :not_found, "")
  end
end
