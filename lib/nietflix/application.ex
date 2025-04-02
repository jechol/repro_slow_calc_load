defmodule Nietflix.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [Nietflix.Repo]

    opts = [strategy: :one_for_one, name: Nietflix.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
