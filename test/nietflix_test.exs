defmodule NietflixTest do
  use ExUnit.Case
  doctest Nietflix

  test "greets the world" do
    assert Nietflix.hello() == :world
  end
end
