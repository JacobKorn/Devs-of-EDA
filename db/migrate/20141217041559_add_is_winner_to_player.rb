class AddIsWinnerToPlayer < ActiveRecord::Migration
  def change
  	add_column :players, :is_winner, :boolean, default: false
  end
end
