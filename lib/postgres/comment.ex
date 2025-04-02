defmodule Postgres.Comment do
  use Common.Comment,
    otp_app: :nietflix,
    domain: Postgres,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "comment"
    repo AshPostgres.Repo
  end
end
