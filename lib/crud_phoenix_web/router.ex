defmodule CrudPhoenixWeb.Router do
  use CrudPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CrudPhoenixWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CrudPhoenixWeb do
    pipe_through :browser

    # Página de inicio
    get "/", PageController, :home

    # Rutas para la funcionalidad de equipos
    resources "/equipos", EquipoController

    # Ruta adicional para listar todos los equipos (acción personalizada)
    get "/equipos/all", EquipoController, :all
    
  end

  # Opciones adicionales para desarrollo
  if Application.compile_env(:crud_phoenix, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CrudPhoenixWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
