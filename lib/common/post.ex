defmodule Nietflix.Post do
  defmacro __using__(opts) do
    {author, opts} = opts |> Keyword.pop(:author)
    post = __CALLER__.module
    {comment, opts} = opts |> Keyword.pop(:comment)

    quote do
      use Ash.Resource, unquote(opts)

      attributes do
        uuid_primary_key :id
      end
    end
  end
end

defmodule Nietflix.Ets.Post do
  use Nietflix.Post,
    otp_app: :nietflix,
    domain: Nietflix.Ets,
    data_layer: Ash.DataLayer.Ets,
    author: Nietflix.Ets.Author,
    comment: Nietflix.Ets.Comment
end

defmodule Nietflix.Postgres.Post do
  use Nietflix.Post,
    otp_app: :nietflix,
    domain: Nietflix.Postgres,
    data_layer: AshPostgres.DataLayer,
    author: Nietflix.Postgres.Author,
    comment: Nietflix.Postgres.Comment

  postgres do
    table "post"
    repo Nietflix.Repo
  end
end
