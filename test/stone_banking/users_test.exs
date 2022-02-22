defmodule StoneBanking.UsersTest do
  alias StoneBanking.Users.User
  alias StoneBanking.Users
  alias StoneBanking.Repo
  use StoneBanking.DataCase

  describe "Users" do
    test "User schema changeset/2 with valid data" do
      {:ok, user} =
        User.changeset(%{email: "assisneto@assis.com", name: "Assis", password: "asdasdasd"})
        |> Repo.insert()

      assert user.id
    end

    test "User schema changeset/2 with invalid data" do
      changeset = User.changeset(%{email: "assisneto.com", name: "Assis", password: "asdasdasd"})

      assert !changeset.valid?
    end

    test "create_user/1" do
      params = %{
        email: "assisneto@assis.com",
        name: "Assis",
        password: "asdasdasd"
      }

      {:ok, %User{}} = Users.create_user(params)
    end
  end
end
