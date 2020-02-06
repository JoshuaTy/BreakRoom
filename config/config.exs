# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chat_room,
  ecto_repos: [ChatRoom.Repo]

# Configures the endpoint
config :chat_room, ChatRoomWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6Myag0YcmO5ZNHIV1YVWvi6zztgRXj/qj9dJbBvShg7jtsmtq5E/b6Y+pRj5nl6S",
  render_errors: [view: ChatRoomWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ChatRoom.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
