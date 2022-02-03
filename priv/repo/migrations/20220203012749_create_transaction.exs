defmodule StoneBanking.Repo.Migrations.CreateTransaction do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :amount, :integer
      add :type, :string

      add :account_origin_id, references(:accounts, type: :uuid)
      add :account_target_id, references(:accounts, type: :uuid)

      timestamps()
    end
  end
end
