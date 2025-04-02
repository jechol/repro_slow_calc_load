defmodule Common.Post do
  defmacro __using__(opts) do
    quote do
      use Ash.Resource, unquote(opts)

      attributes do
        uuid_primary_key :id
      end
    end
  end
end
