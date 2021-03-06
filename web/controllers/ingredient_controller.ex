defmodule CocktailsApi.IngredientController do
  use CocktailsApi.Web, :controller

  alias CocktailsApi.Ingredient

  plug :scrub_params, "ingredient" when action in [:create, :update]

  def index(conn, _params) do
    ingredients = Repo.all(Ingredient)
    render(conn, "index.json", ingredients: ingredients)
  end

  def create(conn, %{"ingredient" => ingredient_params}) do
    changeset = Ingredient.changeset(%Ingredient{}, ingredient_params)

    case Repo.insert(changeset) do
      {:ok, ingredient} ->
        render(conn, "show.json", ingredient: ingredient)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CocktailsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ingredient = Repo.get!(Ingredient, id)
    render conn, "show.json", ingredient: ingredient
  end

  def update(conn, %{"id" => id, "ingredient" => ingredient_params}) do
    ingredient = Repo.get!(Ingredient, id)
    changeset = Ingredient.changeset(ingredient, ingredient_params)

    case Repo.update(changeset) do
      {:ok, ingredient} ->
        render(conn, "show.json", ingredient: ingredient)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CocktailsApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ingredient = Repo.get!(Ingredient, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    ingredient = Repo.delete!(ingredient)

    send_resp(conn, :no_content, "")
  end
end
