import Config

config :nietflix, Nietflix.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "nietflix_dev",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
