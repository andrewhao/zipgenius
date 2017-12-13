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

  test "GET /api/zipcodes", %{conn: conn, zipcode: zipcode} do
    conn =
      conn
      |> get("/api/zipcodes")
      |> doc()

    assert json_response(conn, 200)["zipcodes"] == [
             %{"zip" => zipcode.zip, "timezone" => zipcode.timezone}
           ]
  end

  test "GET /api/zipcodes/:zipcode", %{conn: conn, zipcode: zipcode} do
    conn =
      conn
      |> get(zipcode_path(conn, :show, zipcode))
      |> doc()

    assert json_response(conn, 200)["zipcode"] == %{
             "zip" => zipcode.zip,
             "timezone" => zipcode.timezone
           }
  end

  test "GET /api/zipcodes/invalid", %{conn: conn} do
    conn =
      conn
      |> get(zipcode_path(conn, :show, -1))
      |> doc()

    assert json_response(conn, 404) == %{
             "message" => "Unable to find that zip code"
           }
  end
end