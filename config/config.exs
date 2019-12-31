# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

import_config "scout_apm.exs"

# General application configuration
config :zipgenius, ecto_repos: [Zipgenius.Repo]

# Configures the endpoint
config :zipgenius, Zipgenius.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: Zipgenius.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Zipgenius.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  level: :error,
  metadata: [:request_id]

# Scout log instrumentation
config :zipgenius, Zipgenius.Repo,
  loggers: [{Ecto.LogEntry, :log, [:error]}, {ScoutApm.Instruments.EctoLogger, :log, []}]

config :phoenix, :template_engines, slim: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
