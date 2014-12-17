class BoardSerializer < ActiveModel::Serializer
  attributes :id, :tiles, :players
  has_many :tiles
  has_many :players, order: 'id'
  # def players
  # 	sorted_players = object.sorted_players(true)

  # 	sorted_players

  # 	# sorted_players.each do |player|

  # 	# 	{
  # 	# 		"player_id" => player.id,
  # 	# 		"player_name" => player.name,
	 #  # 		"resources" => {
		#  #  		"fish_and_chips" => object.fish_and_chips,
		# 	# 		"coffee" => object.coffee,
		# 	# 		"haagen" => object.haagen,
		# 	# 		"pizza" => object.pizza,
		# 	# 		"sleep" => object.sleep,
		#  #      "ee_session" => object.ee_session,
		#  #      "victory_points" => object.victory_points
	 #  # 		}
  # 	# 	}
  # 	end
  # end

  end
