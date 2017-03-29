# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kDeBkj4Ws31bOUQN3rlNSt0JKFPjcPdFlQOgvi5kQm+NmtUBe60iExKk7/09xTRQ",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
	providers: [
		github: {Ueberauth.Strategy.Github, []}
	]

# config :ueberauth, Ueberauth.Strategy.Github.Oauth,
# client_id: System.get_env("UEBERAUTH_GITHUB_CLIENT_ID"),
# client_secret: System.get_env("UEBERAUTH_GITHUB_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
client_id: "7a4e8d7ba46afce47d27",
client_secret: "977123008b4e37a805b83c5f3bc10883d12888e1"