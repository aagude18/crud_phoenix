defmodule CrudPhoenixWeb.EquipoController do
  use CrudPhoenixWeb, :controller
  import Ecto.Query, only: [from: 2, dynamic: 2]

  alias CrudPhoenix.Repo
  alias CrudPhoenix.Equipos.Equipo

  # Acción para mostrar todos los equipos
  def all(conn, _params) do
    equipos = Repo.all(Equipo)
    render(conn, "index.html", equipos: equipos, nodo: nil, tipo: nil)
  end

  def show(conn, %{"id" => id}) when id != "all" do
    equipo = Repo.get!(Equipo, id)
    render(conn, "show.html", equipo: equipo)
  end

  # Ruta especial para "all"
  def show(conn, %{"id" => "all"}) do
    all(conn, %{})
  end

  # Acción para manejar búsqueda por nodo y tipo
  def index(conn, %{"search" => search_params}) do
    nodo = Map.get(search_params, "nodo", nil)
    tipo = Map.get(search_params, "tipo", nil)

    # Construye las condiciones dinámicas
    dynamic_conditions =
      true
      |> add_nodo_condition(nodo)
      |> add_tipo_condition(tipo)

    query = from(e in Equipo, where: ^dynamic_conditions)

    equipos = Repo.all(query)
    render(conn, "index.html", equipos: equipos, nodo: nodo, tipo: tipo)
  end

  # Tabla vacía al inicio
  def index(conn, _params) do
    render(conn, "index.html", equipos: [], nodo: nil, tipo: nil)
  end

  # Función auxiliar para añadir condición de nodo
  defp add_nodo_condition(dynamic, nil), do: dynamic
  defp add_nodo_condition(dynamic, nodo), do: dynamic([e], ^dynamic and ilike(e.nodo, ^"%#{nodo}%"))

  # Función auxiliar para añadir condición de tipo
  defp add_tipo_condition(dynamic, nil), do: dynamic
  defp add_tipo_condition(dynamic, tipo), do: dynamic([e], ^dynamic and ilike(e.tipo, ^"%#{tipo}%"))
end
