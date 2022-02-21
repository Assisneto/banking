defmodule StoneBanking.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  import StoneBanking.Changesets

  @required [:name, :email, :password_hash]

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:password_hash, :string)

    has_one(:account, Account)

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:name, min: 2)
    |> validate_email(:email)
    |> unique_constraint([:email])
  end
end
