class BoardSerializer < ActiveModel::Serializer
  attributes :id, :tiles, :players
  has_many :tiles
  has_many :players

  # def player
  # 	player = object.current_player

  # 	{
  # 		"resources" => {
		#   	"fish_and_chips" => player.fish_and_chips,
  #       "coffee" => player.coffee,
  #       "haagen" => player.haagen,
  #       "pizza" => player.pizza,
  #       "sleep" => player.sleep
  # 		}
  # 	}

  # end

end
