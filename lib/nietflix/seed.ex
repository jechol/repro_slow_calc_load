defmodule Nietflix.Seed do
  alias Nietflix.Postgres.{Author, Post, Comment}

  def run do
    1..1000
    |> Enum.map(fn _ ->
      author = Author.create!(%{}, [])

      1..5
      |> Enum.each(fn i ->
        rating = div(i, 5)
        post = Post.create!(%{author_id: author.id, rating: rating})

        1..5
        |> Enum.each(fn i ->
          rating = div(i, 5)
          Comment.create!(%{post_id: post.id, rating: rating})
        end)
      end)

      author
    end)
  end
end
