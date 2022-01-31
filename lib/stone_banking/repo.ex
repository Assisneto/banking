defmodule StoneBanking.Repo do
  use Ecto.Repo,
    otp_app: :stone_banking,
    adapter: Ecto.Adapters.Postgres
end
