class AddBoardIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :board_id, :integer
  end
end
