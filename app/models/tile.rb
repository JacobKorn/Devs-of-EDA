class Tile < ActiveRecord::Base

	has_many :neighbours #, foreign_key: "tile_two" #, inverse_of: :tile_one
	# has_many :tile_twos, through: :neighbours, source: :tile_two

	has_many :neighbours #, inverse_of: :tile_two
	# has_many :tile_ones, through: :neighbours, source: :tile_two


	NEW_LINES = [3, 7, 12, 16, 19]

	def neighbours
		neighbour_groups = Neighbour.where(tile_one_id: self.id) + Neighbour.where(tile_two_id: self.id)
		tiles = []
		neighbour_groups.each do |neighbour_group|
			tiles << neighbour_group.tile_one unless neighbour_group.tile_one == self || tiles.include?( neighbour_group.tile_one )
			tiles << neighbour_group.tile_two unless neighbour_group.tile_two == self || tiles.include?( neighbour_group.tile_two )
		end
		tiles
	end

	def row?
		row = nil
		NEW_LINES.each_with_index do |number, index|
			last_number = 0 unless last_number
			if self.number < number && self.number >= last_number
				row = index
				break
			end
		end
		row
	end

end
