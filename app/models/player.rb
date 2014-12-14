class Player < ActiveRecord::Base

  after_initialize :defaults

  def defaults
    self.wood = 0
    self.sheep = 0
    self.ore = 0
    self.grain = 0
    self.brick = 0
    self.victory_points = 0
  end

  def win?
    victory_points < 5 ? false : true
  end

end

