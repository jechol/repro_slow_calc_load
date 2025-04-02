alias Nietflix.Ets.{Author, Post, Comment}

authors =
  1..10
  |> Enum.map(fn _ ->
    author = Author.create!(%{}, [])

    1..10
    |> Enum.each(fn i ->
      rating = div(i, 5)
      post = Post.create!(%{author_id: author.id, rating: rating})

      1..10
      |> Enum.each(fn i ->
        rating = div(i, 5)
        Comment.create!(%{post_id: post.id, rating: rating})
      end)
    end)

    author
  end)

Benchee.run(%{
  "Author.avg_comment_rating" => fn ->
    authors |> Ash.load!([posts: :avg_comment_rating])
  end,
  "Author.avg_comment_rating_manual_load" => fn ->
    authors |> Ash.load!([posts: :avg_comment_rating_manual_load])
  end
})
