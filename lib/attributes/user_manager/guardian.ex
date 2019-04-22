## lib/attributes/user_manager/guardian.ex

defmodule Attributes.UserManager.Guardian do
  use Guardian, otp_app: :attributes

  alias Attributes.UserManager

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end


  def resource_from_claims(%{"sub" => id}) do
    case UserManager.get_user(id) do
      nil -> {:error, :resource_not_found} # bad ids fail
      user -> {:ok, user}
    end
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
