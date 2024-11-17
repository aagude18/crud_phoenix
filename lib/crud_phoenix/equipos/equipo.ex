defmodule CrudPhoenix.Equipos.Equipo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipos" do
    field :equipo, :string
    field :ref, :string
    field :nodo, :string
    field :punto, :string
    field :tipo, :string
    field :ip_address, :string
    field :usuario, :string
    field :password, :string
    field :estado, :boolean, default: false # Estado predeterminado a falso ("malo")
    field :foto, :string # Campo para la foto
    timestamps()
  end

  def changeset(equipo, attrs) do
    equipo
    |> cast(attrs, [:equipo, :ref, :nodo, :punto, :tipo, :ip_address, :usuario, :password, :estado, :foto])
    |> validate_required([:equipo, :ref, :nodo, :punto, :tipo]) # Solo estos campos son obligatorios
    |> validate_format(:ip_address, ~r/^(\d{1,3}\.){3}\d{1,3}$/, message: "Debe ser una dirección IP válida", allow_nil: true, allow_blank: true) # Permite IP vacía o nula
  end

end
