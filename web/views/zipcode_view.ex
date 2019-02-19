defmodule Zipgenius.ZipcodeView do
  use Zipgenius.Web, :view

  def render("index.json", %{zipcodes: zipcodes}) do
    %{zipcodes: render_many(zipcodes, Zipgenius.ZipcodeView, "zipcode.json")}
  end

  def render("show.json", %{zipcode: zipcode}) do
    %{zipcode: render_one(zipcode, Zipgenius.ZipcodeView, "zipcode.json")}
  end

  def render("zipcode.json", %{zipcode: zipcode}) do
    attrs = ~W(zip timezone city state country)

    zipcode
    |> Map.take(attrs)
  end

  def render("not_found.json", %{}) do
    %{message: "Unable to find that zip code"}
  end
end
