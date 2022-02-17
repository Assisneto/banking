defmodule StoneBanking.Accounts.Account do
  use Ecto.Schema

  alias StoneBanking.Transactions.Transaction
  alias StoneBanking.Users.User
  import Ecto.Changeset

  @required [:balance, :user_id]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field(:balance, :integer)

    belongs_to(:user, User)
    has_many(:transactions_out, Transaction, foreign_key: :account_origin_id)
    has_many(:transactions_in, Transaction, foreign_key: :account_target_id)

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_number(:balance,
      greater_than_or_equal_to: 0,
      message: "The account balance can't be negative."
    )
  end
end
