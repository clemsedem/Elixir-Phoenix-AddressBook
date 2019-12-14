defmodule Materializecss.Repo.Migrations.CreateCountires do
  use Ecto.Migration

  def change do
    create table(:countires) do
      add :name, :string
      add :abbrv, :string
      add :active_status, :boolean, default: true, null: false
      add :del_status, :boolean, default: false, null: false

      timestamps()
    end

  end
end
