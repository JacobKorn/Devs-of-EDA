class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :wood, default: 0
      t.integer :sheep, default: 0
      t.integer :ore, default: 0
      t.integer :grain, default: 0
      t.integer :brick, default: 0
      t.integer :victory_points: 0

      t.timestamps
    end
  end
end
