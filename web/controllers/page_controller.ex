defmodule Xadrez.PageController do
  use Xadrez.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, :index
  end
end
