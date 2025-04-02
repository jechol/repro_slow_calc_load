alias Nietflix.Postgres.{Author, Post, Comment}

Benchee.run(%{
  "avg_comment_rating" => fn ->
    Author.read!(load: [posts: :avg_comment_rating])
  end,
  "avg_comment_rating_manual_load" => fn ->
    Author.read!(load: [posts: :avg_comment_rating_manual_load])
  end
})
