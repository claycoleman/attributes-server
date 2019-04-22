defmodule Attributes.AttributesActivityTest do
  use Attributes.DataCase

  alias Attributes.AttributesActivity

  describe "activity_responses" do
    alias Attributes.AttributesActivity.ActivityResponse

    @valid_attrs %{charity: [], diligence: [], faith: [], hope: [], humility: [], knowledge: [], obedience: [], patience: [], virtue: []}
    @update_attrs %{charity: [], diligence: [], faith: [], hope: [], humility: [], knowledge: [], obedience: [], patience: [], virtue: []}
    @invalid_attrs %{charity: nil, diligence: nil, faith: nil, hope: nil, humility: nil, knowledge: nil, obedience: nil, patience: nil, virtue: nil}

    def activity_response_fixture(attrs \\ %{}) do
      {:ok, activity_response} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AttributesActivity.create_activity_response()

      activity_response
    end

    test "list_activity_responses/0 returns all activity_responses" do
      activity_response = activity_response_fixture()
      assert AttributesActivity.list_activity_responses() == [activity_response]
    end

    test "get_activity_response!/1 returns the activity_response with given id" do
      activity_response = activity_response_fixture()
      assert AttributesActivity.get_activity_response!(activity_response.id) == activity_response
    end

    test "create_activity_response/1 with valid data creates a activity_response" do
      assert {:ok, %ActivityResponse{} = activity_response} = AttributesActivity.create_activity_response(@valid_attrs)
      assert activity_response.charity == []
      assert activity_response.diligence == []
      assert activity_response.faith == []
      assert activity_response.hope == []
      assert activity_response.humility == []
      assert activity_response.knowledge == []
      assert activity_response.obedience == []
      assert activity_response.patience == []
      assert activity_response.virtue == []
    end

    test "create_activity_response/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AttributesActivity.create_activity_response(@invalid_attrs)
    end

    test "update_activity_response/2 with valid data updates the activity_response" do
      activity_response = activity_response_fixture()
      assert {:ok, %ActivityResponse{} = activity_response} = AttributesActivity.update_activity_response(activity_response, @update_attrs)
      assert activity_response.charity == []
      assert activity_response.diligence == []
      assert activity_response.faith == []
      assert activity_response.hope == []
      assert activity_response.humility == []
      assert activity_response.knowledge == []
      assert activity_response.obedience == []
      assert activity_response.patience == []
      assert activity_response.virtue == []
    end

    test "update_activity_response/2 with invalid data returns error changeset" do
      activity_response = activity_response_fixture()
      assert {:error, %Ecto.Changeset{}} = AttributesActivity.update_activity_response(activity_response, @invalid_attrs)
      assert activity_response == AttributesActivity.get_activity_response!(activity_response.id)
    end

    test "delete_activity_response/1 deletes the activity_response" do
      activity_response = activity_response_fixture()
      assert {:ok, %ActivityResponse{}} = AttributesActivity.delete_activity_response(activity_response)
      assert_raise Ecto.NoResultsError, fn -> AttributesActivity.get_activity_response!(activity_response.id) end
    end

    test "change_activity_response/1 returns a activity_response changeset" do
      activity_response = activity_response_fixture()
      assert %Ecto.Changeset{} = AttributesActivity.change_activity_response(activity_response)
    end
  end
end
