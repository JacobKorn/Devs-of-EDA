class Player < ActiveRecord::Base

  def win?
    victory_points < 5 ? false : true
  end

  def increment_resource(player, resource_type)
  	player[resource_type.to_sym] += 1
  end

end

