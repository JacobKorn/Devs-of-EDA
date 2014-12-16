class AddClicksLeftToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :clicks_left, :integer, default: 0
  end
end
