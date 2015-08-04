defmodule CocktailsApi.Repo.Migrations.AddSomeIngredients do
  use Ecto.Migration

  def up do
    execute """
    INSERT INTO "ingredients" ("name", "type", "updated_at", "inserted_at", "image_thumb_uri") VALUES ('Vodka', 'Spirit', '2015-08-04 19:54:21.468680+1000', '2015-08-04 19:54:27.412852+1000', 'http://www.petershamliquormart.com.au/images/products/tn_1879.jpg'), ('Whiskey', 'Spirit', '2015-08-04 19:54:21.468682+1000', '2015-08-04 19:54:27.412855+1000', 'http://pworden.com/wp-content/uploads/2012/10/Dubstep-whiskey-15
    0x150.jpg'), ('White Rum', 'Spirit', '2015-08-04 19:54:21.468683+1000', '2015-08-04 19:54:27.412856+1000', 'http://quickngourbancellars.com.au/image/cache/data/bacardi_superior_100cl_shadow-150x150.jpg'), ('Lime', 'Misc', '2015-08-04 19:54:21.468684+1000', '2015-08-04 19:54:27.412856+1000', 'http://shop.newdirections.com
    .au/WebRoot/Store/Shops/newdirections/502C/D0E0/3C95/FA0C/D188/C0A8/DA15/F81C/lime.jpg'), ('Lemon', 'Misc', '2015-08-04 19:54:21.468685+1000', '2015-08-04 19:54:27.412857+1000', 'http://fivetastes.com.au/~/media/Images/Brands/FiveTastes/Static%20Content%20Pages/Asian%20Ingredient
    s/Tahitian-Lime-150x150%20jpg.jpg'), ('Mint', 'Misc', '2015-08-04 19:54:21.468686+1000', '2015-08-04 19:54:27.412858+1000', 'http://coolsmokingonline.co.uk/wp-content/uploads/2014/07/mint-150x150.jpg'), ('Soda Water', 'Mixer', '2015-08-04 19:54:21.468686+1000', '2015-08-04 19:54:27.412859+1000', 'http://coolspotters.com/
    files/photos/10981/san-pellegrino-large.jpg?1357529909')
    """
  end

  def down do
  end
end
