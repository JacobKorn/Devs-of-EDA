class Player < ActiveRecord::Base

  belongs_to :board
  validates :name, :board_id, presence: true
  def win?
    victory_points < 5 ? false : true
  end

  def increment_resource(player, tile_type)
  	p "---PLAYER"
  	resource_type = Board::TILE_RESOURCE[tile_type]
  	p "--- before increment"
  	p player[resource_type]
  	player[resource_type] += 1
  	player.save
  	p "--- after increment"
  	p player[resource_type]
  end

end

