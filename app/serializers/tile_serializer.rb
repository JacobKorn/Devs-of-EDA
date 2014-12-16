class TileSerializer < ActiveModel::Serializer
  attributes :id, :board_id, :serverX, :serverY, :tile_type, :chit_number

  def serverX
    object.x
  end
  def serverY
    object.y
  end

  def tile_type
    object.tile_type
  end

  def chit_number
    object.number
  end

end
