use Mix.Config

# We run a server during test for Wallaby integration testing.
config :zipgenius, Zipgenius.Endpoint,
  http: [port: 4001],
  server: true,
  secret_key_base: "0123456789012345678901234567890123456789012345678901234567890123456789"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :zipgenius, Zipgenius.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  database: "zipgenius_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :zipgenius, :sql_sandbox, true