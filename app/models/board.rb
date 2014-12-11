class Board	< ActiveRecord::Base
	# attr_accessor :tiles

	has_many :tiles
	

	def create_board
		19.times do |number|
			tiles << Tile.create(number: number, board_id: self.id)
		end
	end

	def set_neighbours
		tiles.each do |tile|
			
		end
	end


	

end