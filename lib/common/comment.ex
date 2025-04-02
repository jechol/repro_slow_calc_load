defmodule Common.Comment do
  defmacro __using__(opts) do
    quote do
      use Ash.Resource, unquote(opts)

      attributes do
        uuid_primary_key :id
      end
    end
  end
end

defmodule Ets.Comment do
  use Common.Comment,
    otp_app: :nietflix,
    domain: Ets,
    data_layer: Ash.DataLayer.Ets
end

defmodule Postgres.Comment do
  use Common.Comment,
    otp_app: :nietflix,
    domain: Postgres,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "comment"
    repo AshPostgres.Repo
  end
end
