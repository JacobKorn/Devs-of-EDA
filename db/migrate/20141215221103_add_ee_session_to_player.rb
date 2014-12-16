class AddEeSessionToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :ee_session, :integer, default: 0
  end
end
