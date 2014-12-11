class AddBoardIdToTiles < ActiveRecord::Migration
  def change
  	add_column :tiles, :board_id, :integer
  end
end
