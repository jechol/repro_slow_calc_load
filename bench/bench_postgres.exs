alias Nietflix.Postgres.Author

Benchee.run(%{
  "Author.posts.avg_comment_rating" => fn ->
    Author.read!(load: [posts: :avg_comment_rating])
  end,
  "Author.posts.avg_comment_rating_manual_load" => fn ->
    Author.read!(load: [posts: :avg_comment_rating_manual_load])
  end
})
