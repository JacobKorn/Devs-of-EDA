class Player < ActiveRecord::Base

  belongs_to :board
  validates :name, :board_id, presence: true
  def win?
    victory_points < 5 ? false : true
  end

  def increment_resource(player, tile_type)
  	resource_type = Board::TILE_RESOURCE[tile_type]
  	player[resource_type] += 1
  	player.save
  end

  def roll_dice
    self.dice_roll = Dice.roll
    self.clicks_left = self.dice_roll
    self.save
    return self.dice_roll
  end

  def decrement_clicks_left
    self.clicks_left -= 1
    self.save
    return self.clicks_left
  end

  def clicks_left?
    true if self.clicks_left > 0
  end

  def conduct_ee_session
    if has_resources?
      decrement_resources
      increment_ee_session
      increment_victory_points
      save
    end
  end

  def decrement_resources
    decrement_sleep
    decrement_coffee
    decrement_pizza
    decrement_haagen
    decrement_fish_and_chips
  end

private

  def increment_victory_points
    self.victory_points += 1
  end

  def increment_ee_session
    self.ee_session += 1
  end

  def decrement_sleep
    self.sleep -= 1 if sleep > 0
  end

  def decrement_coffee
    self.coffee -= 1 if coffee > 0
  end

  def decrement_pizza
    self.pizza -= 1 if pizza > 0
  end

  def decrement_haagen
    self.haagen -= 1 if haagen > 0
  end

  def decrement_fish_and_chips
    self.fish_and_chips -= 1 if fish_and_chips > 0
  end

  def has_resources?
    sleep >= 1 && coffee >= 1 && pizza >= 1 && haagen >= 1 && fish_and_chips >= 1
  end

end

