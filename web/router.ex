defmodule Xadrez.Router do
  use Xadrez.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  scope "/", Xadrez do
    pipe_through :browser

    get "/", PageController, :index
  end
end
