defmodule Postgres.Author do
  use Postgres.Resource,
    otp_app: :nietflix,
    domain: Postgres
end
