class TileSerializer < ActiveModel::Serializer
  attributes :id, :board_id, :x, :y #, :right_neighbour

  # def right_neighbour
  # 	right_neighbour = object.right_neighbour
  # 	if right_neighbour
  # 		{ x: right_neighbour.x, y: right_neighbour.y }
  # 	else
  # 		{ x: nil, y: nil }
  # 	end
  # end
  # attribute :x, :key => :serverX
  # belongs_to :board
end
