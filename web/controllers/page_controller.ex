defmodule Xadrez.PageController do
  use Xadrez.Web, :controller

  def index(conn, _params) do
    render conn, :index
  end
end
