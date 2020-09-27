import Config

config :jwt_example,
    cowboy_port: String.to_integer(System.fetch_env!("COWBOY_PORT")),
    jwt_secret_hs256_signature: System.fetch_env!("HS256_SIGNATURE_KEY")
