defmodule StoneBankingWeb.UsersController do
  use StoneBankingWeb, :controller
  alias StoneBanking.Users
  alias StoneBanking.Users.User

  def create(conn, params),
    do:
      StoneBanking.Users.create_user(params)
      |> format_user()
      |> send_json(conn, 201)

  def format_user({:ok, %User{} = user}),
    do: %{
      id: user.id,
      name: user.name,
      email: user.email
    }

  def send_json(data, conn, status) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(status, Jason.encode!(data))
  end
end
