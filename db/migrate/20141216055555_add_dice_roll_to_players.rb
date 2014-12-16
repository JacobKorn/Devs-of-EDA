class AddDiceRollToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :dice_roll, :integer, default: 0
  end
end
