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
		chit_numbers = [2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12].shuffle
		TILE_COORDS.each do |x, y_group|
			y_group.each do |y|
			tiles << Tile.create(x: x, y: y, number: chit_numbers.pop)
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