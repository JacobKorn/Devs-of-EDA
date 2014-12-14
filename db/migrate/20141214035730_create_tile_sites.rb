class CreateTileSites < ActiveRecord::Migration
  def change
    create_table :tile_sites do |t|
      t.integer :tile_id
      t.integer :site_id

      t.timestamps
    end
  end
end
