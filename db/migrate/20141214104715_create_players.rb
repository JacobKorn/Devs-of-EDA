class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :wood
      t.integer :sheep
      t.integer :ore
      t.integer :grain
      t.integer :brick
      t.integer :victory_points

      t.timestamps
    end
  end
end
