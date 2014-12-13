class TileSerializer < ActiveModel::Serializer
  attributes :id, :board_id, :serverX, :serverY #, :right_neighbour

  # def right_neighbour
  # 	right_neighbour = object.right_neighbour
  # 	if right_neighbour
  # 		{ x: right_neighbour.x, y: right_neighbour.y }
  # 	else
  # 		{ x: nil, y: nil }
  # 	end
  # end
  # attribute :x, key: :serverX

  def serverX
    object.x
  end
  def serverY
    object.y
  end

  # belongs_to :board
end
