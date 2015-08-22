defmodule CocktailsApi.CocktailController do
  use CocktailsApi.Web, :controller

  alias CocktailsApi.Cocktail
  alias CocktailsApi.Ingredient

  import Ecto.Model

  plug :scrub_params, "cocktail" when action in [:create, :update]

  def index(conn, params) do
    query = from(i in Ingredient, where: i.id in ^params["ingredient_id"])
    ingredients = Repo.all(query)
    cocktails_with_missing_ingredients =
      Repo.all(Cocktail)
      |> Enum.map(&(find_missing_ingredients(&1, ingredients)))
      |> Enum.sort_by(&(number_of_missing_ingredients(&1)))
    render(conn, "index.json", cocktails_with_missing_ingredients: cocktails_with_missing_ingredients)
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

  defp find_missing_ingredients(cocktail, current_ingredients) do
    all_ingredients = Cocktail.get_ingredients(cocktail)
    missing_ingredients = all_ingredients -- current_ingredients
    [cocktail: cocktail, missing_ingredients: missing_ingredients]
  end

  defp number_of_missing_ingredients(cocktail_with_missing_ingredients) do
    Enum.count(cocktail_with_missing_ingredients[:missing_ingredients])
  end
end
