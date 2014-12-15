class BoardSerializer < ActiveModel::Serializer
  attributes :id, :tiles, :player
  has_many :tiles

  def player
  	player = Board.current_player(object.id)

  	{
  		"resources" => {
		  	"wood"    => player.wood,
				"sheep"   => player.sheep,
				"ore"     => player.ore,
				"grain"   => player.grain,
				"brick"   => player.brick
  		}
  	}

  end

  # def resources
  # 	player = Board.current_player(object.id)
  	
  # 	{
	 #  	"wood" => player.wood,
		# 	"sheep" => player.sheep,
		# 	"ore" => player.ore,
		# 	"grain" => player.grain,
		# 	"brick" => player.brick
  # 	}	
  # end
end
