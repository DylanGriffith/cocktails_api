defmodule CocktailsApi.IngredientView do
  use CocktailsApi.Web, :view

  def render("index.json", %{ingredients: ingredients}) do
    %{data: render_many(ingredients, "ingredient.json")}
  end

  def render("show.json", %{ingredient: ingredient}) do
    %{data: render_one(ingredient, "ingredient.json")}
  end

  def render("ingredient.json", %{ingredient: ingredient}) do
    %{id: ingredient.id}
  end
end
