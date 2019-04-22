# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :attributes,
  ecto_repos: [Attributes.Repo]

# Configures the endpoint
config :attributes, AttributesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "434RdR5JyrDp7XUtaYAzgme3IgLGs8TqK97Ma6Zo7asUEMDrY1cDiTWQbT0n480I",
  render_errors: [view: AttributesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Attributes.PubSub, adapter: Phoenix.PubSub.PG2]


config :attributes, Attributes.UserManager.Guardian,
  issuer: "attributes",
  secret_key: "A0I3p5xPknQXmSPPTMsemx2lzrB4++QjBy9/28JTEeTHafgCIF/9gyIn+R11XtJ9" # put the result of the mix command above here


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
