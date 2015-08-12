defmodule CocktailsApi.CocktailTest do
  use CocktailsApi.ModelCase

  alias CocktailsApi.Cocktail

  @valid_attrs %{description: "some content", image_thumb_uri: "some content", method: "some content", name: "some content", source_uri: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cocktail.changeset(%Cocktail{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cocktail.changeset(%Cocktail{}, @invalid_attrs)
    refute changeset.valid?
  end
end
