class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :number

      t.timestamps
    end
  end
end
