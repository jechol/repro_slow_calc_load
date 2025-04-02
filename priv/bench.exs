alias Nietflix.{Ets, Postgres}

authors =
  1..100
  |> Enum.map(fn _ ->
    Ets.Author.create!()
  end)

authors
|> Enum.each(fn author ->
  Ets.Post.create!(%{author_id: author.id})
end)

Benchee.run(%{
  "flat_map" => fn -> Enum.flat_map(list, map_fun) end,
  "map.flatten" => fn -> list |> Enum.map(map_fun) |> List.flatten() end
})
