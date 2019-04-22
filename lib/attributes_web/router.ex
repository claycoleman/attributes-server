defmodule AttributesWeb.Router do
  use AttributesWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  # Our pipeline implements "maybe" authenticated. We'll use the `:ensure_auth` below for when we need to make sure someone is logged in.
  pipeline :auth do
    plug(Attributes.UserManager.AuthPipeline)
  end

  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :jwt_authenticated do
    plug(Attributes.UserManager.AuthPipeline)
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", AttributesWeb do
    pipe_through([:browser, :auth])

    get("/", PageController, :index)

    get("/login", SessionController, :new)
    post("/login", SessionController, :login)

    get("/logout", SessionController, :logout)
  end

  # Definitely logged in scope
  scope "/", AttributesWeb do
    pipe_through([:browser, :auth, :ensure_auth])

    get("/secret", PageController, :secret)
  end

  # jwt unauthed routes
  scope "/api/v1", AttributesWeb do
    pipe_through([:api, :auth])

    post("/sign_up", UserController, :create)
    post("/sign_in", UserController, :sign_in)
  end

  # jwt authed routes
  scope "/api/v1", AttributesWeb do
    pipe_through([:api, :jwt_authenticated])

    get("/my_user", UserController, :show)
    resources("/activity_responses", ActivityResponseController, except: [:new, :edit])
  end
end
