defmodule Attributes.UserManager.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:username, :string)
    field(:password_hash, :string) 
    
    # Virtual fields:
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    has_many :activity_responses, Attributes.AttributesActivity.ActivityResponse

    timestamps()
  end

  alias Bcrypt

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :password_confirmation])
    |> validate_required([:username, :password, :password_confirmation])
    |> unique_constraint(:username)
    |> validate_length(:password, min: 8) # Check that password length is >= 8 
    |> validate_confirmation(:password) # Check that password === password_confirmation
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, password_hash: Bcrypt.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
