defmodule CocktailsApi.CocktailView do
  use CocktailsApi.Web, :view

  def render("index.json", %{cocktails: cocktails}) do
    %{data: render_many(cocktails, "cocktail.json")}
  end

  def render("show.json", %{cocktail: cocktail}) do
    %{data: render_one(cocktail, "cocktail.json")}
  end

  def render("cocktail.json", %{cocktail: cocktail}) do
    %{id: cocktail.id, name: cocktail.name, description: cocktail.description, image_thumb_uri: cocktail.image_thumb_uri, method: cocktail.method, source_uri: cocktail.source_uri}
  end
end
