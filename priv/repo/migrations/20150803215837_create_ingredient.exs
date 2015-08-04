defmodule CocktailsApi.Repo.Migrations.CreateIngredient do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :string
      add :type, :string
      add :image_thumb_uri, :string

      timestamps
    end

  end
end
