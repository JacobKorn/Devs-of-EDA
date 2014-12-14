class Player < ActiveRecord::Base

  belongs_to :board

  def win?
    victory_points < 5 ? false : true
  end

end

