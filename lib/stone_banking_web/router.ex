defmodule StoneBankingWeb.Router do
  use StoneBankingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StoneBankingWeb do
    pipe_through :api

    post "/users", UsersController, :create
  end
end
