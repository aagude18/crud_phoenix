defmodule CrudPhoenix.Equipos do
  @moduledoc """
  The Equipos context.
  """

  import Ecto.Query, warn: false
  alias CrudPhoenix.Repo
  alias CrudPhoenix.Equipos.Equipo

  @doc """
  Returns the list of equipos with pagination.

  ## Examples

      iex> list_equipos(%{"page" => 1})
      %Scrivener.Page{entries: [%Equipo{}, ...], page_number: 1, ...}

  """
  def list_equipos(params \\ %{}) do
    alias CrudPhoenix.Equipos.Equipo
  
    query = from e in Equipo
    Repo.paginate(query, params)
  end
  
  # Convierte un enlace estándar de Google Drive al formato directo
  def convertir_enlace_drive(enlace) do
    case Regex.run(~r{/file/d/(.+)/}, enlace) do
      [_, id] ->
        "https://drive.google.com/uc?id=#{id}" # Enlace directo

      _ ->
        enlace # Si no es un enlace de Google Drive, se devuelve tal cual
    end
  end

  @doc """
  Gets a single equipo.

  Raises `Ecto.NoResultsError` if the Equipo does not exist.

  ## Examples

      iex> get_equipo!(123)
      %Equipo{}

      iex> get_equipo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_equipo!(id), do: Repo.get!(Equipo, id)

  @doc """
  Creates a equipo.

  ## Examples

      iex> create_equipo(%{field: value})
      {:ok, %Equipo{}}

      iex> create_equipo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_equipo(attrs \\ %{}) do
    %Equipo{}
    |> Equipo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a equipo.

  ## Examples

      iex> update_equipo(equipo, %{field: new_value})
      {:ok, %Equipo{}}

      iex> update_equipo(equipo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_equipo(%Equipo{} = equipo, attrs) do
    equipo
    |> Equipo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a equipo.

  ## Examples

      iex> delete_equipo(equipo)
      {:ok, %Equipo{}}

      iex> delete_equipo(equipo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_equipo(%Equipo{} = equipo) do
    Repo.delete(equipo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking equipo changes.

  ## Examples

      iex> change_equipo(equipo)
      %Ecto.Changeset{data: %Equipo{}}

  """
  def change_equipo(%Equipo{} = equipo, attrs \\ %{}) do
    Equipo.changeset(equipo, attrs)
  end
end
