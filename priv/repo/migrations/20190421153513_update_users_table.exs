defmodule Attributes.Repo.Migrations.UpdateUsersTable do
  use Ecto.Migration

  def change do
    add :password, :string

  end
end
