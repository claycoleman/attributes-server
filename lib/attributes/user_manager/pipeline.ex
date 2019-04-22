## lib/attributes/user_manager/pipeline.ex

defmodule Attributes.UserManager.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :attributes,
    error_handler: Attributes.UserManager.ErrorHandler,
    module: Attributes.UserManager.Guardian

  # If there is a session token, restrict it to an access token and validate it
  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  # If there is an authorization header, restrict it to an access token and validate it
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  # another potential header
  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
