defmodule CocktailsApi.Repo.Migrations.CreateCocktailIngredient do
  use Ecto.Migration

  def change do
    create table(:cocktail_ingredients) do
      add :cocktail_id, references(:cocktails)
      add :ingredient_id, references(:ingredients)

      timestamps
    end

  end
end
