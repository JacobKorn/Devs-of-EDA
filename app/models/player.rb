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

  def conduct_ee_session(player)
    if player[sleep] >= 1 && player[coffee] >= 1 && player[pizza] >= 1 && player[haagen] >= 1
      player[ee_session] += 1
      player[sleep] -= 1
      player[coffee] -= 1
      player[pizza] -= 1
      player[haagen] -= 1
      player.save
    end
  end

end

