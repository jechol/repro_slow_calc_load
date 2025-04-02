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

defmodule Ets.Post do
  use Common.Post,
    otp_app: :nietflix,
    domain: Ets,
    data_layer: Ash.DataLayer.Ets
end

defmodule Postgres.Post do
  use Common.Post,
    otp_app: :nietflix,
    domain: Postgres,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "post"
    repo AshPostgres.Repo
  end
end
