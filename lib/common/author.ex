defmodule Nietflix.Author do
  defmacro __using__(opts) do
    _author = __CALLER__.module
    {post, opts} = opts |> Keyword.pop(:post)
    {_comment, opts} = opts |> Keyword.pop(:comment)

    quote do
      use Ash.Resource, unquote(opts)

      attributes do
        uuid_primary_key :id
      end

      actions do
        defaults [:read, :destroy, create: :*, update: :*]
      end

      relationships do
        has_many :posts, unquote(post)
      end

      calculations do
        calculate :avg_post_rating, :float do
          load :posts

          calculation fn authors, _ctx ->
            authors
            |> Enum.map(fn %{posts: posts} ->
              count = posts |> Enum.count()
              sum = posts |> Enum.map(& &1.rating) |> Enum.sum()
              (sum / count) |> Float.round(2)
            end)
          end
        end
      end
    end
  end
end

defmodule Nietflix.Ets.Author do
  use Nietflix.Author,
    otp_app: :nietflix,
    domain: Nietflix.Ets,
    data_layer: Ash.DataLayer.Ets,
    post: Nietflix.Ets.Post,
    comment: Nietflix.Ets.Comment
end

defmodule Nietflix.Postgres.Author do
  use Nietflix.Author,
    otp_app: :nietflix,
    domain: Nietflix.Postgres,
    data_layer: AshPostgres.DataLayer,
    post: Nietflix.Postgres.Post,
    comment: Nietflix.Postgres.Comment

  postgres do
    table "author"
    repo Nietflix.Repo
  end
end
