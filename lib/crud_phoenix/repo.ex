defmodule CrudPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :crud_phoenix,
    adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 20 # Define un tamaño de página predeterminado de 20 registros
end
