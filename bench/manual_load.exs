alias Nietflix.Postgres.{Author, Post, Comment}

Benchee.run(%{
  "avg_comment_rating_manual_load" => fn ->
    Author.read!(load: [posts: :avg_comment_rating_manual_load])
  end
})
