defmodule AttributesWeb.UserController do
  use AttributesWeb, :controller

  alias Attributes.UserManager
  alias Attributes.UserManager.User
  alias Attributes.UserManager.Guardian

  action_fallback(AttributesWeb.FallbackController)

  def index(conn, _params) do
    users = UserManager.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- UserManager.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn |> render("jwt.json", jwt: token)
    end
  end

  def show(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "user.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = UserManager.get_user!(id)

    with {:ok, %User{} = user} <- UserManager.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = UserManager.get_user!(id)

    with {:ok, %User{}} <- UserManager.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def sign_in(conn, %{"username" => username, "password" => password}) do
    case UserManager.token_sign_in(username, password) do
      {:ok, token, _claims} ->
        conn |> render("jwt.json", jwt: token)
      _ ->
        {:error, :unauthorized}
    end
  end

end
