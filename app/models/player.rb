class Player < ActiveRecord::Base

  belongs_to :board
  validates :name, :board_id, presence: true
  def win?
    victory_points < 5 ? false : true
  end

  def increment_resource(player, resource_type)
  	player[resource_type.to_sym] += 1
  end

end

