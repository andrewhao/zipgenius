defmodule Zipgenius.Router do
  use Zipgenius.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Zipgenius do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/api", Zipgenius do
    pipe_through(:api)

    resources("/zipcodes", ZipcodeController, except: [:new, :edit])
  end
end