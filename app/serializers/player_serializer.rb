class PlayerSerializer < ActiveModel::Serializer
  attributes :player_id, :resources, :player_name

  def player_id
  	object.id
  end

  def player_name
  	object.name
  end

  def resources
  	{
	  	"wood" => object.wood,
			"sheep" => object.sheep,
			"ore" => object.ore,
			"grain" => object.grain,
			"brick" => object.brick
  	}	
  end

end
