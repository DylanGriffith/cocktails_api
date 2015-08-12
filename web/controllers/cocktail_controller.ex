defmodule CocktailsApi.CocktailController do
  use CocktailsApi.Web, :controller

  alias CocktailsApi.Cocktail

  plug :scrub_params, "cocktail" when action in [:create, :update]

  def index(conn, _params) do
    cocktails = Repo.all(Cocktail)
    render(conn, "index.json", cocktails: cocktails)
  end

  def create(conn, %{"cocktail" => cocktail_params}) do
    changeset = Cocktail.changeset(%Cocktail{}, cocktail_params)

    case Repo.insert(changeset) do
      {:ok, cocktail} ->
        render(conn, "show.json", cocktail: cocktail)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CocktailsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cocktail = Repo.get!(Cocktail, id)
    render conn, "show.json", cocktail: cocktail
  end

  def update(conn, %{"id" => id, "cocktail" => cocktail_params}) do
    cocktail = Repo.get!(Cocktail, id)
    changeset = Cocktail.changeset(cocktail, cocktail_params)

    case Repo.update(changeset) do
      {:ok, cocktail} ->
        render(conn, "show.json", cocktail: cocktail)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CocktailsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cocktail = Repo.get!(Cocktail, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    cocktail = Repo.delete!(cocktail)

    send_resp(conn, :no_content, "")
  end
end
