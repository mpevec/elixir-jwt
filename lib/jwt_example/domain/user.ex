defmodule JwtExample.Domain.User do
  # just simple matching and hardcoded user
  def get_user(email, password) do
    case {email, password} do
      {"john.doe@hey.com", "abc123"} ->
        {:ok,
         %{
           "id" => 1,
           "groups" => ["admin"],
           "first_name" => "John",
           "last_name" => "Doe",
           "email" => email
         }}

      _ ->
        {:error, "Unknown user."}
    end
  end
end
