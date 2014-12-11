class Board	
	attr_accessor :tiles
	NEW_LINES = [3, 7, 12, 16, 19]

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

	def row?(tile)
		row = nil
		NEW_LINES.each_with_index do |number, index|
			last_number = 0 unless last_number
			if tile.number < number && tile.number >= last_number
				row = index
				break
			end
		end
		row
	end

end