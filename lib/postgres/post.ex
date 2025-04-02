defmodule Postgres.Post do
  use Common.Post,
    otp_app: :nietflix,
    domain: Postgres,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "post"
    repo AshPostgres.Repo
  end
end
