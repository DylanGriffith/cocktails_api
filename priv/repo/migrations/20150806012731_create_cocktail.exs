defmodule CocktailsApi.Repo.Migrations.CreateCocktail do
  use Ecto.Migration

  def change do
    create table(:cocktails) do
      add :name, :string
      add :image_thumb_uri, :string
      add :description, :string
      add :method, :string
      add :source_uri, :string

      timestamps
    end

  end
end
