defmodule CrudPhoenix.EquiposTest do
  use CrudPhoenix.DataCase

  alias CrudPhoenix.Equipos

  describe "equipos" do
    alias CrudPhoenix.Equipos.Equipo

    import CrudPhoenix.EquiposFixtures

    @invalid_attrs %{equipo: nil, estado: nil, ip_address: nil, nodo: nil, password: nil, punto: nil, ref: nil, tipo: nil, usuario: nil}

    test "list_equipos/0 returns all equipos" do
      equipo = equipo_fixture()
      assert Equipos.list_equipos() == [equipo]
    end

    test "get_equipo!/1 returns the equipo with given id" do
      equipo = equipo_fixture()
      assert Equipos.get_equipo!(equipo.id) == equipo
    end

    test "create_equipo/1 with valid data creates a equipo" do
      valid_attrs = %{equipo: "some equipo", estado: true, ip_address: "some ip_address", nodo: "some nodo", password: "some password", punto: "some punto", ref: "some ref", tipo: "some tipo", usuario: "some usuario"}

      assert {:ok, %Equipo{} = equipo} = Equipos.create_equipo(valid_attrs)
      assert equipo.equipo == "some equipo"
      assert equipo.estado == true
      assert equipo.ip_address == "some ip_address"
      assert equipo.nodo == "some nodo"
      assert equipo.password == "some password"
      assert equipo.punto == "some punto"
      assert equipo.ref == "some ref"
      assert equipo.tipo == "some tipo"
      assert equipo.usuario == "some usuario"
    end

    test "create_equipo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Equipos.create_equipo(@invalid_attrs)
    end

    test "update_equipo/2 with valid data updates the equipo" do
      equipo = equipo_fixture()
      update_attrs = %{equipo: "some updated equipo", estado: false, ip_address: "some updated ip_address", nodo: "some updated nodo", password: "some updated password", punto: "some updated punto", ref: "some updated ref", tipo: "some updated tipo", usuario: "some updated usuario"}

      assert {:ok, %Equipo{} = equipo} = Equipos.update_equipo(equipo, update_attrs)
      assert equipo.equipo == "some updated equipo"
      assert equipo.estado == false
      assert equipo.ip_address == "some updated ip_address"
      assert equipo.nodo == "some updated nodo"
      assert equipo.password == "some updated password"
      assert equipo.punto == "some updated punto"
      assert equipo.ref == "some updated ref"
      assert equipo.tipo == "some updated tipo"
      assert equipo.usuario == "some updated usuario"
    end

    test "update_equipo/2 with invalid data returns error changeset" do
      equipo = equipo_fixture()
      assert {:error, %Ecto.Changeset{}} = Equipos.update_equipo(equipo, @invalid_attrs)
      assert equipo == Equipos.get_equipo!(equipo.id)
    end

    test "delete_equipo/1 deletes the equipo" do
      equipo = equipo_fixture()
      assert {:ok, %Equipo{}} = Equipos.delete_equipo(equipo)
      assert_raise Ecto.NoResultsError, fn -> Equipos.get_equipo!(equipo.id) end
    end

    test "change_equipo/1 returns a equipo changeset" do
      equipo = equipo_fixture()
      assert %Ecto.Changeset{} = Equipos.change_equipo(equipo)
    end
  end
end
