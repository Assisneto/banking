defmodule StoneBanking.Users do
  alias StoneBanking.Accounts.Account
  alias StoneBanking.Users.User
  alias StoneBanking.Repo

  def create_user(attrs),
    do:
      with(
        {:ok, user} <- User.changeset(attrs) |> Repo.insert(),
        {:ok, _account} <- create_account(user),
        do: {:ok, user}
      )

  def create_account(%User{id: id}),
    do:
      Account.changeset(%{balance: 1000, user_id: id})
      |> Repo.insert()
end
