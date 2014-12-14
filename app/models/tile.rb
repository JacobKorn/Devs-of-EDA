class Tile < ActiveRecord::Base

	belongs_to :board

	has_many :tile_sites
	has_many :sites, through: :tile_sites

	def neighbour_0
		Tile.where(board_id: board_id, x: x - 1, y: y + 1).first
	end

	def neighbour_1
		Tile.where(board_id: board_id, x: x, y: y + 1).first
	end

	def neighbour_2
		Tile.where(board_id: board_id, x: x + 1, y: y).first
	end

	def neighbour_3
		Tile.where(board_id: board_id, x: x + 1, y: y - 1).first
	end

	def neighbour_4
		Tile.where(board_id: board_id, x: x, y: y - 1).first
	end	

	def neighbour_5
		Tile.where(board_id: board_id, x: x - 1, y: y).first
	end	

	def site_0
		Site.find(site_0_id)
	end

	def site_1
		Site.find(site_1_id)
	end

	def site_2
		Site.find(site_2_id)
	end

	def site_3
		Site.find(site_3_id)
	end

	def site_4
		Site.find(site_4_id)
	end

	def site_5
		Site.find(site_5_id)
	end

	def discover_site_0
		neighbour_5 = top_left_neighbour
		neighbour_0 = top_left_neighbour
		
		if neighbour_5 || neighbour_0
			unless neighbour_5.site_2
				
			end
		end

	end


end
