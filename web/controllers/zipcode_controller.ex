defmodule Zipgenius.ZipcodeController do
  use Zipgenius.Web, :controller

  alias Zipgenius.Zipcode

  def index(conn, _params) do
    zipcodes = Repo.all(Zipcode)
    render(conn, "index.json", zipcodes: zipcodes)
  end

  def show(conn, %{"id" => zip}) do
    case Repo.get_by(Zipcode, zip: zip) do
      nil ->
        conn
        |> put_status(:not_found)
        |> render("not_found.json", %{})

      zipcode ->
        conn
        |> render("show.json", zipcode: zipcode)
    end
  end
end