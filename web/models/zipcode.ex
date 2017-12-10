defmodule Zipgenius.Zipcode do
  use Zipgenius.Web, :model

  @primary_key false
  schema "timezonebyzipcode" do
    field :idtimezonebyzipcode, :id
    field :zip, :string
    field :city, :string
    field :county, :string
    field :state, :string
    field :country, :string
    field :timezone, :string
    field :addressquality, :integer
    field :source, :string
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:zip, :city, :county, :state, :country, :timezone, :addressquality, :source])
    |> validate_required([:zip, :city, :county, :state, :country, :timezone, :addressquality, :source])
  end
end
