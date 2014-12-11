class CreateIntersections < ActiveRecord::Migration
  def change
    create_table :intersections do |t|
      t.integer :tile_id
      t.integer :point_id

      t.timestamps
    end
  end
end
