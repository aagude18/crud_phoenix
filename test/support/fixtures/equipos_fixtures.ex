defmodule CrudPhoenix.EquiposFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CrudPhoenix.Equipos` context.
  """

  @doc """
  Generate a equipo.
  """
  def equipo_fixture(attrs \\ %{}) do
    {:ok, equipo} =
      attrs
      |> Enum.into(%{
        equipo: "some equipo",
        estado: true,
        ip_address: "some ip_address",
        nodo: "some nodo",
        password: "some password",
        punto: "some punto",
        ref: "some ref",
        tipo: "some tipo",
        usuario: "some usuario"
      })
      |> CrudPhoenix.Equipos.create_equipo()

    equipo
  end
end
