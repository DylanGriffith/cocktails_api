defmodule CocktailsApi.CocktailControllerTest do
  use CocktailsApi.ConnCase

  alias CocktailsApi.Cocktail
  @valid_attrs %{description: "some content", image_thumb_uri: "some content", method: "some content", name: "some content", source_uri: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, cocktail_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    cocktail = Repo.insert! %Cocktail{}
    conn = get conn, cocktail_path(conn, :show, cocktail)
    assert json_response(conn, 200)["data"] == %{
      "id" => cocktail.id
    }
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, cocktail_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, cocktail_path(conn, :create), cocktail: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Cocktail, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cocktail_path(conn, :create), cocktail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    cocktail = Repo.insert! %Cocktail{}
    conn = put conn, cocktail_path(conn, :update, cocktail), cocktail: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Cocktail, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    cocktail = Repo.insert! %Cocktail{}
    conn = put conn, cocktail_path(conn, :update, cocktail), cocktail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    cocktail = Repo.insert! %Cocktail{}
    conn = delete conn, cocktail_path(conn, :delete, cocktail)
    assert response(conn, 204)
    refute Repo.get(Cocktail, cocktail.id)
  end
end
