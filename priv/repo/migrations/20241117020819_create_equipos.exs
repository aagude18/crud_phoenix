defmodule CrudPhoenix.Repo.Migrations.CreateEquipos do
  use Ecto.Migration

  def change do
    create table(:equipos) do
      add :equipo, :string
      add :ref, :string
      add :nodo, :string
      add :punto, :string
      add :tipo, :string
      add :ip_address, :string
      add :usuario, :string
      add :password, :string
      add :estado, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
