class Board	< ActiveRecord::Base

	TILE_COORDS = {
		-2 => [         0, 1, 2 ],
		-1 => [    	-1, 0, 1, 2	],
		 0 => [ -2, -1, 0, 1, 2 ],
		 1 => [ -2, -1, 0, 1 		],
		 2 => [ -2, -1, 0				]
	}


	has_many :tiles
	
	def populate
		TILE_COORDS.each do |x, y_group|
			y_group.each do |y|
				tiles << Tile.create(x: x, y: y)
			end
		end
	end





	

end