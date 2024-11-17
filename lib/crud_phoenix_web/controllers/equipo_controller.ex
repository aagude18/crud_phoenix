defmodule CrudPhoenixWeb.EquipoController do
  use CrudPhoenixWeb, :controller

  alias CrudPhoenix.Equipos
  alias CrudPhoenix.Equipos.Equipo

  def index(conn, params) do
    equipos = Equipos.list_equipos(params)
    render(conn, :index, conn: conn, equipos: equipos)
  end

  def new(conn, _params) do
    changeset = Equipos.change_equipo(%Equipo{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"equipo" => equipo_params}) do
    case Equipos.create_equipo(equipo_params) do
      {:ok, equipo} ->
        conn
        |> put_flash(:info, "Equipo created successfully.")
        |> redirect(to: ~p"/equipos/#{equipo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    equipo = Equipos.get_equipo!(id)
    render(conn, :show, equipo: equipo)
  end

  def edit(conn, %{"id" => id}) do
    equipo = Equipos.get_equipo!(id)
    changeset = Equipos.change_equipo(equipo)
    render(conn, :edit, equipo: equipo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "equipo" => equipo_params}) do
    equipo = Equipos.get_equipo!(id)

    case Equipos.update_equipo(equipo, equipo_params) do
      {:ok, equipo} ->
        conn
        |> put_flash(:info, "Equipo updated successfully.")
        |> redirect(to: ~p"/equipos/#{equipo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, equipo: equipo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    equipo = Equipos.get_equipo!(id)
    {:ok, _equipo} = Equipos.delete_equipo(equipo)

    conn
    |> put_flash(:info, "Equipo deleted successfully.")
    |> redirect(to: ~p"/equipos")
  end
end
