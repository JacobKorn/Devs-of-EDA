class CreateNeighbours < ActiveRecord::Migration
  def change
    create_table :neighbours do |t|
      t.integer :tile_one_id
      t.integer :tile_two_id
      t.integer :tile_one_edge
      t.integer :tile_two_edge

      t.timestamps
    end
  end
end
