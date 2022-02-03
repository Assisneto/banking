defmodule StoneBanking.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :balance, :integer
      add :user_id, references(:users, type: :uuid)

      timestamps()
    end

    create unique_index(:accounts, [:user_id])
  end
end
