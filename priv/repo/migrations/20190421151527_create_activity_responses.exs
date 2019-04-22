defmodule Attributes.Repo.Migrations.CreateActivityResponses do
  use Ecto.Migration

  def change do
    create table(:activity_responses) do
      add :faith, {:array, :integer}
      add :hope, {:array, :integer}
      add :charity, {:array, :integer}
      add :virtue, {:array, :integer}
      add :knowledge, {:array, :integer}
      add :patience, {:array, :integer}
      add :humility, {:array, :integer}
      add :diligence, {:array, :integer}
      add :obedience, {:array, :integer}

      timestamps()
    end

  end
end
