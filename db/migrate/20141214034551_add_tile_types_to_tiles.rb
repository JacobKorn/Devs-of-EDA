class AddTileTypesToTiles < ActiveRecord::Migration
  def change
  	add_column :tiles, :tile_type, :string
  end
end
