import Config

Code.compile_file("config/secret.exs")

config :logger, :console,
  format: "\n##### $time $metadata[$level] $levelpad$message\n",
  metadata: :all

config :jwt_example,
  cowboy_port: 4001,
  jwt_issuer: "Matthieu Labs SRL",
  jwt_expiration_time_minutes: 30,
  jwt_secret_hs256_signature: Secret.get("hs256-signature-key", "default secret string")

import_config "#{Mix.env()}.exs"
