use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :xadrez, Xadrez.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :xadrez, Xadrez.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  username: "postgres",
  password: "postgres",
  database: "xadrez_test",
  size: 1 # Use a single connection for transactional tests
