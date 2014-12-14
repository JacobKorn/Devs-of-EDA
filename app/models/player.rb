class Player < ActiveRecord::Base

  def win?
    victory_points < 5 ? false : true
  end

end

