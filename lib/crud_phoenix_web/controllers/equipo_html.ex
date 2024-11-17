defmodule CrudPhoenixWeb.EquipoHTML do
  use CrudPhoenixWeb, :html

  embed_templates "equipo_html/*"

  @doc """
  Renders a equipo form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def equipo_form(assigns)
end
