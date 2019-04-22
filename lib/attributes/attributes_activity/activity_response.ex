defmodule Attributes.AttributesActivity.ActivityResponse do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activity_responses" do
    belongs_to :user, Attributes.UserManager.User

    field :faith, {:array, :integer}
    field :hope, {:array, :integer}
    field :charity, {:array, :integer}
    field :virtue, {:array, :integer}
    field :knowledge, {:array, :integer}
    field :patience, {:array, :integer}
    field :humility, {:array, :integer}
    field :diligence, {:array, :integer}
    field :obedience, {:array, :integer}

    timestamps()
  end

  @doc false
  def changeset(activity_response, attrs) do
    activity_response
    |> cast(attrs, [:user_id, :faith, :hope, :charity, :virtue, :knowledge, :patience, :humility, :diligence, :obedience])
    |> validate_required([:user_id, :faith, :hope, :charity, :virtue, :knowledge, :patience, :humility, :diligence, :obedience])
  end
end
