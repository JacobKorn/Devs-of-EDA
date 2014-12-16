class BoardSerializer < ActiveModel::Serializer
  attributes :id, :tiles, :players
  has_many :tiles
  has_many :players

  end
