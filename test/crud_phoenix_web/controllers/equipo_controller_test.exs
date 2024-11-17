defmodule CrudPhoenixWeb.EquipoControllerTest do
  use CrudPhoenixWeb.ConnCase

  import CrudPhoenix.EquiposFixtures

  @create_attrs %{equipo: "some equipo", estado: true, ip_address: "some ip_address", nodo: "some nodo", password: "some password", punto: "some punto", ref: "some ref", tipo: "some tipo", usuario: "some usuario"}
  @update_attrs %{equipo: "some updated equipo", estado: false, ip_address: "some updated ip_address", nodo: "some updated nodo", password: "some updated password", punto: "some updated punto", ref: "some updated ref", tipo: "some updated tipo", usuario: "some updated usuario"}
  @invalid_attrs %{equipo: nil, estado: nil, ip_address: nil, nodo: nil, password: nil, punto: nil, ref: nil, tipo: nil, usuario: nil}

  describe "index" do
    test "lists all equipos", %{conn: conn} do
      conn = get(conn, ~p"/equipos")
      assert html_response(conn, 200) =~ "Listing Equipos"
    end
  end

  describe "new equipo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/equipos/new")
      assert html_response(conn, 200) =~ "New Equipo"
    end
  end

  describe "create equipo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/equipos", equipo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/equipos/#{id}"

      conn = get(conn, ~p"/equipos/#{id}")
      assert html_response(conn, 200) =~ "Equipo #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/equipos", equipo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Equipo"
    end
  end

  describe "edit equipo" do
    setup [:create_equipo]

    test "renders form for editing chosen equipo", %{conn: conn, equipo: equipo} do
      conn = get(conn, ~p"/equipos/#{equipo}/edit")
      assert html_response(conn, 200) =~ "Edit Equipo"
    end
  end

  describe "update equipo" do
    setup [:create_equipo]

    test "redirects when data is valid", %{conn: conn, equipo: equipo} do
      conn = put(conn, ~p"/equipos/#{equipo}", equipo: @update_attrs)
      assert redirected_to(conn) == ~p"/equipos/#{equipo}"

      conn = get(conn, ~p"/equipos/#{equipo}")
      assert html_response(conn, 200) =~ "some updated equipo"
    end

    test "renders errors when data is invalid", %{conn: conn, equipo: equipo} do
      conn = put(conn, ~p"/equipos/#{equipo}", equipo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Equipo"
    end
  end

  describe "delete equipo" do
    setup [:create_equipo]

    test "deletes chosen equipo", %{conn: conn, equipo: equipo} do
      conn = delete(conn, ~p"/equipos/#{equipo}")
      assert redirected_to(conn) == ~p"/equipos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/equipos/#{equipo}")
      end
    end
  end

  defp create_equipo(_) do
    equipo = equipo_fixture()
    %{equipo: equipo}
  end
end
