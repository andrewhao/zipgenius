defmodule Zipgenius.PageController do
  use Zipgenius.Web, :controller

  def index(conn, _params) do
    conn
    |> render("index.html")
  end
end
