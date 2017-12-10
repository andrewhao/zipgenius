defmodule Zipgenius.ZipcodeControllerTest do
  use Zipgenius.ConnCase

  alias Zipgenius.Zipcode

  @valid_attrs %{
    zip: "94606",
    state: "CA",
    city: "Oakland",
    county: "Alameda",
    country: "United States",
    addressquality: 60,
    source: "Yahoo",
    timezone: "America/Los_Angeles"
  }

  setup %{conn: conn} do
    zipcode = %Zipcode{} |> Map.merge(@valid_attrs) |> Repo.insert!()
    {:ok, conn: put_req_header(conn, "accept", "application/json"), zipcode: zipcode}
  end

  test "lists all entries on index", %{conn: conn, zipcode: zipcode} do
    conn = get(conn, zipcode_path(conn, :index))

    assert json_response(conn, 200)["zipcodes"] == [
             %{"zip" => zipcode.zip, "timezone" => zipcode.timezone}
           ]
  end

  test "shows chosen resource", %{conn: conn, zipcode: zipcode} do
    conn = get(conn, zipcode_path(conn, :show, zipcode))

    assert json_response(conn, 200)["zipcode"] == %{
             "zip" => zipcode.zip,
             "timezone" => zipcode.timezone
           }
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent(404, fn ->
      get(conn, zipcode_path(conn, :show, -1))
    end)
  end
end