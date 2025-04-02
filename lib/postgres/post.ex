defmodule Postgres.Post do
  use Postgres.Resource,
    otp_app: :nietflix,
    domain: Postgres
end
