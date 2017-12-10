defmodule Zipgenius.ZipcodeController do
  use Zipgenius.Web, :controller

  alias Zipgenius.Zipcode

  def index(conn, _params) do
    zipcodes = Repo.all(Zipcode)
    render(conn, "index.json", zipcodes: zipcodes)
  end

  def show(conn, %{"id" => zip}) do
    zipcode = Repo.get_by!(Zipcode, zip: zip)
    render(conn, "show.json", zipcode: zipcode)
  end
end