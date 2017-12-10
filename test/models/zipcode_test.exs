defmodule Zipgenius.ZipcodeTest do
  use Zipgenius.ModelCase

  alias Zipgenius.Zipcode

  @valid_attrs %{
    addressquality: 42,
    city: "some content",
    country: "some content",
    county: "some content",
    source: "some content",
    state: "some content",
    timezone: "some content",
    zip: "some content"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Zipcode.changeset(%Zipcode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Zipcode.changeset(%Zipcode{}, @invalid_attrs)
    refute changeset.valid?
  end
end