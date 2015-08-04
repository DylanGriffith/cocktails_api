defmodule CocktailsApi.Router do
  use CocktailsApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CocktailsApi do
    pipe_through :api
    resources "/ingredients", IngredientController, only: [:index, :create, :show, :update, :delete]
  end
end
