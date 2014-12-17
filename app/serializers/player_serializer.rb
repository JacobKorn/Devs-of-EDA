class PlayerSerializer < ActiveModel::Serializer
  attributes  :player_id, 
              :player_name,
              :clicks_left,
              :resources

  def player_id
  	object.id
  end

  def player_name
  	object.name
  end

  def resources
  	{
	  	"fish_and_chips" => object.fish_and_chips,
			"coffee" => object.coffee,
			"haagen" => object.haagen,
			"pizza" => object.pizza,
			"sleep" => object.sleep,
      "ee_session" => object.ee_session,
      "victory_points" => object.victory_points
  	}	
  end

end
