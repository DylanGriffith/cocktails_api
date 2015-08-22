defmodule CocktailsApi.Cocktail do
  use CocktailsApi.Web, :model

  alias CocktailsApi.Ingredient
  alias CocktailsApi.CocktailIngredient

  alias CocktailsApi.Ingredient

  import Ecto.Model

  schema "cocktails" do
    has_many :cocktail_ingredients, CocktailIngredient
    field :name, :string
    field :image_thumb_uri, :string
    field :description, :string
    field :method, :string
    field :source_uri, :string

    timestamps
  end

  @required_fields ~w(name image_thumb_uri description method source_uri)
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

  def get_ingredients(cocktail) do
    query = from i in Ingredient,
      join: ci in assoc(i, :cocktail_ingredients),
      where: ci.cocktail_id == ^cocktail.id,
      select: {i}
    CocktailsApi.Repo.all(query) |> Enum.map(fn(i) -> elem(i, 0) end)
  end
end
