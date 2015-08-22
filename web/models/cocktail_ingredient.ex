defmodule CocktailsApi.CocktailIngredient do
  use CocktailsApi.Web, :model

  schema "cocktail_ingredients" do
    belongs_to :cocktail, Cocktail
    belongs_to :ingredient, Ingredient

    timestamps
  end

  @required_fields ~w(cocktail_id ingredient_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
