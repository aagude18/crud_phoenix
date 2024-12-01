defmodule CrudPhoenixWeb.PaginationHelper do
  import Phoenix.HTML

  def pagination_links(_conn, _pagination) do
    # Mensaje estático para evitar errores relacionados con la paginación
    raw("<span>No se ha implementado la paginación</span>")
  end
end
