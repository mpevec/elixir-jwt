import Config

Code.compile_file("config/secret.exs")

config :jwt_example,
  cowboy_port: 4001,
  jwt_issuer: "Matthieu Labs SRL",
  jwt_expiration_time_minutes: 30,
  jwt_secret_hs256_signature: Secret.get("hs256-signature-key")

import_config "#{Mix.env()}.exs"
