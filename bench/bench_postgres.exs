alias Nietflix.Postgres.Author

Benchee.run(%{
  "Author.avg_post_rating" => fn ->
    Author.read!(load: :avg_post_rating)
  end,
  "Author.avg_post_rating_manual_load" => fn ->
    Author.read!(load: :avg_post_rating_manual_load)
  end
})
