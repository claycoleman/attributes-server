defmodule AttributesWeb.ActivityResponseView do
  use AttributesWeb, :view
  alias AttributesWeb.ActivityResponseView

  def render("index.json", %{activity_responses: activity_responses}) do
    %{data: render_many(activity_responses, ActivityResponseView, "activity_response.json")}
  end

  def render("show.json", %{activity_response: activity_response}) do
    %{data: render_one(activity_response, ActivityResponseView, "activity_response.json")}
  end

  def render("activity_response.json", %{activity_response: activity_response}) do
    %{
      id: activity_response.id,
      user_id: activity_response.user_id,
      faith: activity_response.faith,
      hope: activity_response.hope,
      charity: activity_response.charity,
      virtue: activity_response.virtue,
      knowledge: activity_response.knowledge,
      patience: activity_response.patience,
      humility: activity_response.humility,
      diligence: activity_response.diligence,
      obedience: activity_response.obedience,
      date_created: activity_response.inserted_at
    }
  end
end
