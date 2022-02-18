defmodule StoneBanking.AccountsTest do
  alias StoneBanking.Accounts.Account
  alias StoneBanking.Repo
  alias StoneBanking.Utils.Factory
  use StoneBanking.DataCase

  describe "Accounts" do
    test "Accounts schema changeset/2 with valid data" do
      {:ok, user} = Factory.user()

      {:ok, account} =
        Account.changeset(%{balance: 1000, user_id: user.id})
        |> Repo.insert()

      assert account.id
    end

    test "Accounts schema changeset/2 with invalid data" do
      {:ok, user} = Factory.user()

      changeset = Account.changeset(%{balance: -1, user_id: user.id})

      assert !changeset.valid?
    end
  end
end
