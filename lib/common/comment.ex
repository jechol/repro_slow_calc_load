defmodule Nietflix.Comment do
  defmacro __using__(opts) do
    {_author, opts} = opts |> Keyword.pop(:author)
    {post, opts} = opts |> Keyword.pop(:post)
    _comment = __CALLER__.module

    quote do
      use Ash.Resource, unquote(opts)

      attributes do
        uuid_primary_key :id
      end

      actions do
        defaults [:read, :destroy, create: :*, update: :*]
      end

      relationships do
        belongs_to :post, unquote(post)
      end
    end
  end
end

defmodule Nietflix.Ets.Comment do
  use Nietflix.Comment,
    otp_app: :nietflix,
    domain: Nietflix.Ets,
    data_layer: Ash.DataLayer.Ets,
    author: Nietflix.Ets.Author,
    post: Nietflix.Ets.Post
end

defmodule Nietflix.Postgres.Comment do
  use Nietflix.Comment,
    otp_app: :nietflix,
    domain: Nietflix.Postgres,
    data_layer: AshPostgres.DataLayer,
    author: Nietflix.Postgres.Author,
    post: Nietflix.Postgres.Post

  postgres do
    table "comment"
    repo Nietflix.Repo
  end
end
