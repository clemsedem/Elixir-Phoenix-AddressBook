defmodule MaterializecssWeb.Router do
  use MaterializecssWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MaterializecssWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/countries", CountryController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MaterializecssWeb do
  #   pipe_through :api
  # end
end
