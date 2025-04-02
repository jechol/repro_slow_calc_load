defmodule Nietflix.Postgres do
  use Ash.Domain,
    otp_app: :nietflix

  resources do
    resource Nietflix.Postgres.Author
    resource Nietflix.Postgres.Post
    resource Nietflix.Postgres.Comment
  end
end
