class Board	< ActiveRecord::Base

	TILE_COORDS = {
		-2 => [  0,  1, 2 ],
		-1 => [ -1,  0, 1, 2],
		 0 => [ -2, -1, 0, 1, 2 ],
		 1 => [ -2, -1, 0, 1 ],
		 2 => [ -2, -1, 0]
	}


	has_many :tiles
	
	def populate
		TILE_COORDS.each do |x, y_group|
			y_group.each do |y|
				tiles << Tile.create(x: x, y: y)
			end
		end
	end


	# def populate_paths
	# 	tiles.each do |tile|
	# 		unless tile.right_neighbour == nil
	# 			Path.create(tile_one: , tile_two: )
	# 		end
	# 	end
	# end


	

end