defmodule Materializecss.Countries.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "countires" do
    field :abbrv, :string
    field :active_status, :boolean, default: false
    field :del_status, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name, :abbrv, :active_status, :del_status])
    |> validate_required([:name, :abbrv, :active_status, :del_status])
  end
end
