defmodule CrudPhoenix.Repo.Migrations.AddNameToEquipos do
  use Ecto.Migration

  def change do
    alter table(:equipos) do
      add :name, :string
    end
  end
end
