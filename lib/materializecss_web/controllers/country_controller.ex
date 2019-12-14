defmodule MaterializecssWeb.CountryController do
  use MaterializecssWeb, :controller

  alias Materializecss.Countries
  alias Materializecss.Countries.Country

  def index(conn, _params) do
    countires = Countries.list_countires()
    render(conn, "index.html", countires: countires)
  end

  def new(conn, _params) do
    changeset = Countries.change_country(%Country{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"country" => country_params}) do
    case Countries.create_country(country_params) do
      {:ok, country} ->
        conn
        |> put_flash(:info, "Country created successfully.")
        |> redirect(to: Routes.country_path(conn, :show, country))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    country = Countries.get_country!(id)
    render(conn, "show.html", country: country)
  end

  def edit(conn, %{"id" => id}) do
    country = Countries.get_country!(id)
    changeset = Countries.change_country(country)
    render(conn, "edit.html", country: country, changeset: changeset)
  end

  def update(conn, %{"id" => id, "country" => country_params}) do
    country = Countries.get_country!(id)

    case Countries.update_country(country, country_params) do
      {:ok, country} ->
        conn
        |> put_flash(:info, "Country updated successfully.")
        |> redirect(to: Routes.country_path(conn, :show, country))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", country: country, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    country = Countries.get_country!(id)
    {:ok, _country} = Countries.delete_country(country)

    conn
    |> put_flash(:info, "Country deleted successfully.")
    |> redirect(to: Routes.country_path(conn, :index))
  end
end
