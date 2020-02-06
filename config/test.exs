use Mix.Config

# Configure your database
config :chat_room, ChatRoom.Repo,
  username: "postgres",
  password: "1234",
  database: "chat_room_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chat_room, ChatRoomWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
