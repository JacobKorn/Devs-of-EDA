class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.integer :number
      t.integer :type_id

      t.timestamps
    end
  end
end
