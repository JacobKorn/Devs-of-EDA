class Neighbour < ActiveRecord::Base

	belongs_to :tile_one, class_name: "Tile"
	belongs_to :tile_two, class_name: "Tile"

end
