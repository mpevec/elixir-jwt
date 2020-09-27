defmodule Secret do
  def get(secret) do
    get(secret, "")
  end

  def get(secret, default_value) do
    # chmod 755 the folder
    path = "/opt/app/secrets/#{secret}"

    case File.read(path) do
      {:ok, value} ->
        IO.puts("#{secret} read from #{path}")
        String.trim(value)

      _ ->
        IO.puts("#{secret} read from environment or default")
        System.get_env(secret, default_value)
    end
  end
end
