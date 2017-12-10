defmodule Zipgenius.PageControllerTest do
  use Zipgenius.ConnCase, async: true

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Zipgenius"
  end
end