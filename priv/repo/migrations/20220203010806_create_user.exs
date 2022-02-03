defmodule StoneBanking.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :uuid, primary_key: true, null: false)
      add(:name, :string)
      add(:email, :string)
      add(:password_hash, :string)

      timestamps()
    end

    create(unique_index(:users, [:email]))
  end
end
