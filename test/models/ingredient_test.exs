defmodule CocktailsApi.IngredientTest do
  use CocktailsApi.ModelCase

  alias CocktailsApi.Ingredient

  @valid_attrs %{image_thumb_uri: "some content", name: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ingredient.changeset(%Ingredient{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ingredient.changeset(%Ingredient{}, @invalid_attrs)
    refute changeset.valid?
  end
end
