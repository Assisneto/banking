defmodule StoneBanking.Transactions.Transaction do
  use Ecto.Schema

  alias StoneBanking.Accounts.Account
  import Ecto.Changeset

  @required [:amount, :type, :account_origin_id, :account_target_id]

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @transaction_type_transfer "transfer"
  @transaction_type_withdraw "withdraw"

  schema "transactions" do
    field(:amount, :integer)
    field(:type, :string)
    field(:account_origin_id, :binary_id)
    field(:account_target_id, :binary_id)

    belongs_to(:account_origin, Account,
      foreign_key: :account_origin_id,
      references: :id,
      define_field: false
    )

    belongs_to(:account_target, Account,
      foreign_key: :account_target_id,
      references: :id,
      define_field: false
    )

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_number(:amount, greater_than_or_equal_to: 1)
  end

  def get_transaction_type_transfer(), do: @transaction_type_transfer
  def get_transaction_type_withdraw(), do: @transaction_type_withdraw
end
