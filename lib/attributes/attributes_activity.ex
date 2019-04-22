defmodule Attributes.AttributesActivity do
  @moduledoc """
  The AttributesActivity context.
  """

  import Ecto.Query, warn: false
  alias Attributes.Repo

  alias Attributes.AttributesActivity.ActivityResponse

  @doc """
  Returns the list of activity_responses.

  ## Examples

      iex> list_activity_responses()
      [%ActivityResponse{}, ...]

  """
  def list_activity_responses do
    Repo.all(ActivityResponse)
  end

  
  def list_activity_responses_for_user_id(user_id) do
    query = from(ar in ActivityResponse, where: ar.user_id == ^user_id)
    Repo.all(query)
  end

  @doc """
  Gets a single activity_response.

  Raises `Ecto.NoResultsError` if the Activity response does not exist.

  ## Examples

      iex> get_activity_response!(123)
      %ActivityResponse{}

      iex> get_activity_response!(456)
      ** (Ecto.NoResultsError)

  """
  def get_activity_response!(id), do: Repo.get!(ActivityResponse, id)

  @doc """
  Creates a activity_response.

  ## Examples

      iex> create_activity_response(%{field: value})
      {:ok, %ActivityResponse{}}

      iex> create_activity_response(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_activity_response(attrs \\ %{}) do
    %ActivityResponse{}
    |> ActivityResponse.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a activity_response.

  ## Examples

      iex> update_activity_response(activity_response, %{field: new_value})
      {:ok, %ActivityResponse{}}

      iex> update_activity_response(activity_response, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_activity_response(%ActivityResponse{} = activity_response, attrs) do
    activity_response
    |> ActivityResponse.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ActivityResponse.

  ## Examples

      iex> delete_activity_response(activity_response)
      {:ok, %ActivityResponse{}}

      iex> delete_activity_response(activity_response)
      {:error, %Ecto.Changeset{}}

  """
  def delete_activity_response(%ActivityResponse{} = activity_response) do
    Repo.delete(activity_response)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking activity_response changes.

  ## Examples

      iex> change_activity_response(activity_response)
      %Ecto.Changeset{source: %ActivityResponse{}}

  """
  def change_activity_response(%ActivityResponse{} = activity_response) do
    ActivityResponse.changeset(activity_response, %{})
  end
end
