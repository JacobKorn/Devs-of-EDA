class BoardSerializer < ActiveModel::Serializer
  attributes :id, :tiles, :player
  has_many :tiles

  def player
  	player = Board.current_player(object.id)

  	{
  		"resources" => {
		  	"fish_and_chips" => player.fish_and_chips,
        "coffee" => player.coffee,
        "haagen" => player.haagen,
        "pizza" => player.pizza,
        "sleep" => player.sleep
  		}
  	}

  end


end
