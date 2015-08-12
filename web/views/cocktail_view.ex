defmodule CocktailsApi.CocktailView do
  use CocktailsApi.Web, :view

  def render("index.json", %{cocktails: cocktails}) do
    %{data: render_many(cocktails, "cocktail.json")}
  end

  def render("show.json", %{cocktail: cocktail}) do
    %{data: render_one(cocktail, "cocktail.json")}
  end

  def render("cocktail.json", %{cocktail: cocktail}) do
    %{id: cocktail.id}
  end
end
