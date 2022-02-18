defmodule StoneBanking.TransactionsTest do
  alias StoneBanking.Transactions.Transaction
  alias StoneBanking.Repo
  alias StoneBanking.Utils.Factory
  use StoneBanking.DataCase

  describe "Transactions" do
    test "Transactions schema changeset/2 with valid data" do
      {:ok, account1} = Factory.account()
      {:ok, account2} = Factory.account()

      {:ok, transaction} =
        Transaction.changeset(%{
          amount: 200,
          type: Transaction.get_transaction_type_transfer(),
          account_origin_id: account1.id,
          account_target_id: account2.id
        })
        |> Repo.insert()

      assert transaction.id
    end

    test "Accounts schema changeset/2 with invalid data" do
      {:ok, account1} = Factory.account()
      {:ok, account2} = Factory.account()

      changeset =
        Transaction.changeset(%{
          amount: 0,
          type: Transaction.get_transaction_type_transfer(),
          account_origin_id: account1.id,
          account_target_id: account2.id
        })

      assert !changeset.valid?
    end

    test "Accounts schema changeset/2 with type withdraw" do
      {:ok, account} = Factory.account()

      {:ok, transaction} =
        Transaction.changeset(%{
          amount: 200,
          type: Transaction.get_transaction_type_withdraw(),
          account_origin_id: account.id,
          account_target_id: account.id
        })
        |> Repo.insert()

      assert transaction.id
    end
  end
end
