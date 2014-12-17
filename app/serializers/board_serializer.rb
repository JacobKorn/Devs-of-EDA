class BoardSerializer < ActiveModel::Serializer
  attributes :id, :tiles, :players
  has_many :tiles

  def players
  	object.sorted_players(true)
  end

  end
