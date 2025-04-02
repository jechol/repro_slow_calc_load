defmodule Common.Author do
  defmacro __using__(opts) do
    quote do
      use Ash.Resource, unquote(opts)

      attributes do
        uuid_primary_key :id
      end
    end
  end
end

defmodule Ets.Author do
  use Common.Author,
    otp_app: :nietflix,
    domain: Ets,
    data_layer: Ash.DataLayer.Ets
end

defmodule Postgres.Author do
  use Common.Author,
    otp_app: :nietflix,
    domain: Postgres,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "author"
    repo Nietflix.Repo
  end
end
