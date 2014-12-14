class AddSitesToTiles < ActiveRecord::Migration
  def change
  	add_column :tiles, :site_0_id, :integer
  	add_column :tiles, :site_1_id, :integer
  	add_column :tiles, :site_2_id, :integer
  	add_column :tiles, :site_3_id, :integer
  	add_column :tiles, :site_4_id, :integer
  	add_column :tiles, :site_5_id, :integer
  end
end
