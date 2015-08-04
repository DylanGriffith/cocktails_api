defmodule CocktailsApi.Ingredient do
  use CocktailsApi.Web, :model

  schema "ingredients" do
    field :name, :string
    field :type, :string
    field :image_thumb_uri, :string

    timestamps
  end

  @required_fields ~w(name type image_thumb_uri)
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
