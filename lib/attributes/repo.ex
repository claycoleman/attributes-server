defmodule Attributes.Repo do
  use Ecto.Repo,
    otp_app: :attributes,
    adapter: Ecto.Adapters.Postgres
end
