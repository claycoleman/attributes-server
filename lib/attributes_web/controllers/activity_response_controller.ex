defmodule AttributesWeb.ActivityResponseController do
  use AttributesWeb, :controller

  alias Attributes.AttributesActivity
  alias Attributes.AttributesActivity.ActivityResponse

  action_fallback(AttributesWeb.FallbackController)

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    activity_responses = AttributesActivity.list_activity_responses_for_user_id(user.id)
    render(conn, "index.json", activity_responses: activity_responses)
  end

  def create(conn, %{"activity_response" => activity_response_params}) do
    user = Guardian.Plug.current_resource(conn)
    IO.inspect(user)
    IO.inspect(user.id)

    with {:ok, %ActivityResponse{} = activity_response} <-
           AttributesActivity.create_activity_response(
             Map.put(activity_response_params, "user_id", user.id)
           ) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.activity_response_path(conn, :show, activity_response)
      )
      |> render("show.json", activity_response: activity_response)
    end
  end

  def show(conn, %{"id" => id}) do
    activity_response = AttributesActivity.get_activity_response!(id)
    render(conn, "show.json", activity_response: activity_response)
  end

  def update(conn, %{"id" => id, "activity_response" => activity_response_params}) do
    user = Guardian.Plug.current_resource(conn)
    activity_response = AttributesActivity.get_activity_response!(id)

    if activity_response.user_id == user.id do
      with {:ok, %ActivityResponse{} = activity_response} <-
             AttributesActivity.update_activity_response(
               activity_response,
               activity_response_params
             ) do
        render(conn, "show.json", activity_response: activity_response)
      end
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    activity_response = AttributesActivity.get_activity_response!(id)

    if activity_response.user_id == user.id do
      with {:ok, %ActivityResponse{}} <-
             AttributesActivity.delete_activity_response(activity_response) do
        send_resp(conn, :no_content, "")
      end
    end
  end
end
