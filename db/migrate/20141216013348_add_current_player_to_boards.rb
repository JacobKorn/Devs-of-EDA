class AddCurrentPlayerToBoards < ActiveRecord::Migration
  def change
  	add_column :boards, :current_player_id, :integer
  end
end
