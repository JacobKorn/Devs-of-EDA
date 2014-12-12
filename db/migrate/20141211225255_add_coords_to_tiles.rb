class AddCoordsToTiles < ActiveRecord::Migration
  def change
  	add_column :tiles, :x, :integer
  	add_column :tiles, :y, :integer
  end
end
