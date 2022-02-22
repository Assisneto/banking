defmodule StoneBanking.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  import StoneBanking.Changesets
  alias StoneBanking.Accounts.Account

  @required [:name, :email, :password]

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field :password, :string, virtual: true
    field :password_hash, :string
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
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ),
       do: change(changeset, Bcrypt.add_hash(password))

  defp put_password_hash(changeset), do: changeset
end
