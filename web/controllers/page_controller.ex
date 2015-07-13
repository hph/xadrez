defmodule Xadrez.PageController do
  use Xadrez.Web, :controller

  def index(conn, _params) do
    redirect conn, to: "/#{UUID.uuid4}"
  end

  def show(conn, _params) do
    render conn, :show
  end
end
