class BoardSerializer < ActiveModel::Serializer
  attributes :id, :tiles, :player
  has_many :tiles

  def player
  	player = object.current_player

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
