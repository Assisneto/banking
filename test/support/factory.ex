defmodule StoneBanking.Utils.Factory do
  alias StoneBanking.Users.User
  alias StoneBanking.Accounts.Account
  alias StoneBanking.Repo

  def user(),
    do:
      User.changeset(%{
        email: "assisneto#{System.unique_integer([:positive])}@assis.com",
        name: "Assis",
        password: "asdasdasd"
      })
      |> Repo.insert()

  def account() do
    {:ok, user} = user()

    Account.changeset(%{balance: 1000, user_id: user.id})
    |> Repo.insert()
  end
end
