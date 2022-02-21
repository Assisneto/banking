defmodule StoneBanking.UsersTest do
  alias StoneBanking.Users.User
  alias StoneBanking.Users
  alias StoneBanking.Repo
  use StoneBanking.DataCase

  describe "Users" do
    test "User schema changeset/2 with valid data" do
      {:ok, user} =
        User.changeset(%{email: "assisneto@assis.com", name: "Assis", password_hash: "asdasdasd"})
        |> Repo.insert()

      assert user.id
    end

    test "User schema changeset/2 with invalid data" do
      changeset =
        User.changeset(%{email: "assisneto.com", name: "Assis", password_hash: "asdasdasd"})

      assert !changeset.valid?
    end

    test "create_user/1" do
      user =
        Users.create_user(%{
          email: "assisneto@assis.com",
          name: "Assis",
          password_hash: "asdasdasd"
        })

      assert user.id
      assert Map.has_key?(user, :account)
      assert user.account.balance == 1000
    end
  end
end
