defmodule Xadrez.Router do
  use Xadrez.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipe_through :browser

  get "/", Xadrez.PageController, :index, as: :root
  get "/:uuid", Xadrez.PageController, :show
end
