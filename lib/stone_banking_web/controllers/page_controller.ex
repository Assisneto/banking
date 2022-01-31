defmodule StoneBankingWeb.PageController do
  use StoneBankingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
