defmodule AttributesWeb.ActivityResponseControllerTest do
  use AttributesWeb.ConnCase

  alias Attributes.AttributesActivity
  alias Attributes.AttributesActivity.ActivityResponse

  @create_attrs %{
    charity: [],
    diligence: [],
    faith: [],
    hope: [],
    humility: [],
    knowledge: [],
    obedience: [],
    patience: [],
    virtue: []
  }
  @update_attrs %{
    charity: [],
    diligence: [],
    faith: [],
    hope: [],
    humility: [],
    knowledge: [],
    obedience: [],
    patience: [],
    virtue: []
  }
  @invalid_attrs %{charity: nil, diligence: nil, faith: nil, hope: nil, humility: nil, knowledge: nil, obedience: nil, patience: nil, virtue: nil}

  def fixture(:activity_response) do
    {:ok, activity_response} = AttributesActivity.create_activity_response(@create_attrs)
    activity_response
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all activity_responses", %{conn: conn} do
      conn = get(conn, Routes.activity_response_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create activity_response" do
    test "renders activity_response when data is valid", %{conn: conn} do
      conn = post(conn, Routes.activity_response_path(conn, :create), activity_response: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.activity_response_path(conn, :show, id))

      assert %{
               "id" => id,
               "charity" => [],
               "diligence" => [],
               "faith" => [],
               "hope" => [],
               "humility" => [],
               "knowledge" => [],
               "obedience" => [],
               "patience" => [],
               "virtue" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.activity_response_path(conn, :create), activity_response: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update activity_response" do
    setup [:create_activity_response]

    test "renders activity_response when data is valid", %{conn: conn, activity_response: %ActivityResponse{id: id} = activity_response} do
      conn = put(conn, Routes.activity_response_path(conn, :update, activity_response), activity_response: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.activity_response_path(conn, :show, id))

      assert %{
               "id" => id,
               "charity" => [],
               "diligence" => [],
               "faith" => [],
               "hope" => [],
               "humility" => [],
               "knowledge" => [],
               "obedience" => [],
               "patience" => [],
               "virtue" => []
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, activity_response: activity_response} do
      conn = put(conn, Routes.activity_response_path(conn, :update, activity_response), activity_response: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete activity_response" do
    setup [:create_activity_response]

    test "deletes chosen activity_response", %{conn: conn, activity_response: activity_response} do
      conn = delete(conn, Routes.activity_response_path(conn, :delete, activity_response))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.activity_response_path(conn, :show, activity_response))
      end
    end
  end

  defp create_activity_response(_) do
    activity_response = fixture(:activity_response)
    {:ok, activity_response: activity_response}
  end
end
