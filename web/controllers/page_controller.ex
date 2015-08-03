defmodule CocktailsApi.PageController do
  use CocktailsApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
