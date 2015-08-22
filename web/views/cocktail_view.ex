defmodule CocktailsApi.CocktailView do
  use CocktailsApi.Web, :view

  def render("index.json", %{cocktails_with_missing_ingredients: cocktails_with_missing_ingredients}) do
    %{data: Enum.map(cocktails_with_missing_ingredients, &(render("cocktail.json", &1)))}
  end

  def render("show.json", %{cocktail: cocktail}) do
    %{data: render_one(cocktail, "cocktail.json")}
  end

  def render("cocktail.json", %{cocktail: cocktail, missing_ingredients: missing_ingredients}) do
    %{id: cocktail.id, name: cocktail.name, description: cocktail.description, image_thumb_uri: cocktail.image_thumb_uri, method: cocktail.method, source_uri: cocktail.source_uri, missing_ingredients: Enum.map(missing_ingredients, &(%{name: &1.name}))}
  end
end
