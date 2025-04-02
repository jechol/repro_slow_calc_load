alias Nietflix.{Ets, Postgres}

ets_authors =
  1..1
  |> Enum.map(fn _ ->
    author = Ets.Author.create!(%{}, [])

    1..1
    |> Enum.each(fn i ->
      rating = div(i, 5)
      Ets.Post.create!(%{author_id: author.id, rating: rating})
    end)

    author
  end)

Benchee.run(%{
  "Author.avg_post_rating" => fn ->
    ets_authors |> Ash.load!(:avg_post_rating)
  end,
  "Author.avg_post_rating_manual_load" => fn ->
    ets_authors |> Ash.load!(:avg_post_rating_manual_load)
  end
})
