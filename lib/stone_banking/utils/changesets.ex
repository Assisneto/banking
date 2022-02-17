defmodule StoneBanking.Changesets do
  import Ecto.Changeset
  @email_regex ~r/^[A-Za-z0-9\._%+\-+']+@[A-Za-z0-9\.\-]+\.[A-Za-z]{2,4}$/

  def validate_email(changeset, field) do
    validate_format(changeset, field, @email_regex)
  end
end
