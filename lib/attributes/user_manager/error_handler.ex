## lib/attributes/user_manager/error_handler.ex

defmodule Attributes.UserManager.ErrorHandler do
  import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    # plain text response
    # body = to_string(type)
    # conn
    # |> put_resp_content_type("text/plain")
    # |> send_resp(401, body)

    body = Jason.encode!(%{error: to_string(type)})
    send_resp(conn, 401, body)
  end
end
