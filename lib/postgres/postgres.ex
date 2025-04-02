defmodule Postgres do
  use Ash.Domain,
    otp_app: :nietflix

  resources do
    resource Postgres.Author
    resource Postgres.Post
    resource Postgres.Comment
  end
end
