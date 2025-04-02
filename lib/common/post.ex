defmodule Nietflix.Post do
  defmacro __using__(opts) do
    {author, opts} = opts |> Keyword.pop(:author)
    _post = __CALLER__.module
    {comment, opts} = opts |> Keyword.pop(:comment)

    quote do
      use Ash.Resource, unquote(opts)
      require Ash.Query

      attributes do
        uuid_primary_key :id

        attribute :rating, :integer, public?: true
      end

      actions do
        defaults [:read, create: :*]
      end

      code_interface do
        define :create
      end

      relationships do
        belongs_to :author, unquote(author),
          attribute_public?: true,
          attribute_writable?: true

        has_many :comments, unquote(comment)
      end

      calculations do
        calculate :avg_comment_rating, :float do
          load comments: :rating

          calculation fn posts, _ctx ->
            posts
            |> Enum.map(fn %{comments: comments} ->
              count = comments |> Enum.count()
              sum = comments |> Enum.map(& &1.rating) |> Enum.sum()
              (sum / count) |> Float.round(2)
            end)
          end
        end

        calculate :avg_comment_rating_manual_load, :float do
          calculation fn posts, _ctx ->
            post_ids = posts |> Enum.map(& &1.id)

            post_comments =
              unquote(comment)
              |> Ash.Query.for_read(:read)
              |> Ash.Query.filter(post.id in ^post_ids)
              |> Ash.read!()
              |> Enum.group_by(& &1.post_id)

            posts
            |> Enum.map(fn post ->
              comments = post_comments |> Map.get(post.id, [])

              count = comments |> Enum.count()
              sum = comments |> Enum.map(& &1.rating) |> Enum.sum()
              (sum / count) |> Float.round(2)
            end)
          end
        end
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

    custom_indexes do
      index [:author_id]
    end
  end
end
