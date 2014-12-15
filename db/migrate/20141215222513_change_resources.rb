class ChangeResources < ActiveRecord::Migration
  def change
  	rename_column :players, :wood, :fish_and_chips
  	rename_column :players, :sheep, :coffee
  	rename_column :players, :ore, :haagen
  	rename_column :players, :grain, :pizza
  	rename_column :players, :brick, :sleep
  end
end
