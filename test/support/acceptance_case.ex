defmodule Zipgenius.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Zipgenius.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import Zipgenius.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Zipgenius.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Zipgenius.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Zipgenius.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
