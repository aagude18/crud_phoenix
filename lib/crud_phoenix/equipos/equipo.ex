defmodule CrudPhoenix.Equipos.Equipo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "equipos" do
    field :name, :string                      # Nuevo campo para el nombre
    field :equipo, :string
    field :ref, :string
    field :nodo, :string
    field :punto, :string
    field :tipo, :string
    field :ip_address, :string
    field :usuario, :string
    field :password, :string
    field :estado, :boolean, default: false  # Estado predeterminado a falso ("malo")
    field :foto, :string                     # Campo para la foto
    timestamps()
  end

  # Changeset para validaciones
  def changeset(equipo, attrs) do
    equipo
    |> cast(attrs, [
      :name,
      :equipo,
      :ref,
      :nodo,
      :punto,
      :tipo,
      :ip_address,
      :usuario,
      :password,
      :estado,
      :foto
    ])                                       # Asegúrate de incluir todas las claves relevantes
    |> validate_required([
      :name,
      :equipo,
      :ref,
      :nodo,
      :punto,
      :tipo
    ])                                       # Valida que estos campos sean obligatorios
    |> validate_length(:name, min: 3, max: 50, message: "El nombre debe tener entre 3 y 50 caracteres")
    |> validate_format(
      :ip_address,
      ~r/^(\\d{1,3}\\.){3}\\d{1,3}$/,
      message: "Debe ser una dirección IP válida",
      allow_nil: true
    )                                        # Valida el formato de IP, permitiendo valores nulos
  end
end

