defmodule Postgres.Author do
  use Common.Author,
    otp_app: :nietflix,
    domain: Postgres,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "author"
    repo AshPostgres.Repo
  end
end
