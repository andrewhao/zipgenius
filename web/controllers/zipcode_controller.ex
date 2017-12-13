defmodule Zipgenius.ZipcodeController do
  use Zipgenius.Web, :controller

  alias Zipgenius.Zipcode

  def index(conn, _params) do
    zipcodes = Repo.all(Zipcode)

    conn
    |> put_resp_header("cache-control", "max-age=31556926")
    |> render("index.json", zipcodes: zipcodes)
  end

  def show(conn, %{"id" => zip}) do
    case Repo.get_by(Zipcode, zip: zip) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_resp_header("cache-control", "max-age=31556926")
        |> render("not_found.json", %{})

      zipcode ->
        conn
        |> put_resp_header("cache-control", "max-age=31556926")
        |> render("show.json", zipcode: zipcode)
    end
  end
end