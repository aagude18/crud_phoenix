defmodule CrudPhoenixWeb.PaginationHelper do
  import Phoenix.HTML

  def pagination_links(conn, pagination) do
    # Construye las páginas como una lista de strings
    links =
      Enum.map(1..pagination.total_pages, fn page ->
        if page == pagination.page_number do
          # Usa directamente HTML para la página actual
          ~s(<span class="current-page">#{page}</span>)
        else
          # Genera enlaces para las otras páginas
          ~s(<a href="#{Routes.equipo_path(conn, :index, page: page)}" class="pagination-link">#{page}</a>)
        end
      end)

    # Combina las páginas en un único string seguro para HTML
    raw(Enum.join(links, " "))
  end
end
