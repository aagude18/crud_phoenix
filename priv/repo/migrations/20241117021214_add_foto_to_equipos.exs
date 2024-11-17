defmodule CrudPhoenix.Repo.Migrations.AddFotoToEquipos do
  use Ecto.Migration

  def change do
    alter table(:equipos) do
      add :foto, :string
    end
  end
end
