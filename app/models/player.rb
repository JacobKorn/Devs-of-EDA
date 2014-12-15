class Player < ActiveRecord::Base

  belongs_to :board
  validates :name, :board_id, presence: true
  def win?
    victory_points < 5 ? false : true
  end

  def increment_resource(player, tile_type)
  	resource_type = Board::TILE_RESOURCE[tile_type]
  	player[resource_type] += 1
  	player.save
  end

end

