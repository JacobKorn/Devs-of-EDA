class Board	
	attr_accessor :tiles
	

	def initialize
		@tiles = []
	end

	def create_board
		19.times do |number|
			@tiles << Tile.create(number: number)
		end
	end

	def set_neighbours
		@tiles.each do |tile|
			
		end
	end


	

end