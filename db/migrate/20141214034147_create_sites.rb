class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :tile_one_id
      t.string :integer
      t.integer :tile_two_id
      t.integer :tile_three_id

      t.timestamps
    end
  end
end
