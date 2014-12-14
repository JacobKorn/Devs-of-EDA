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
		if site_0_id
			Site.find_by(id: site_0_id)
		else
			nil
		end
	end

	def site_1
		if site_1_id
			Site.find_by(id: site_1_id)
		else
			nil
		end
	end

	def site_2
		if site_2_id
			Site.find_by(id: site_2_id)
		else
			nil
		end	
	end

	def site_3
		if site_3_id
			Site.find_by(id: site_3_id)
		else
			nil
		end
	end

	def site_4
		if site_4_id
			Site.find_by(id: site_4_id)
		else
			nil
		end
	end

	def site_5
		if site_5_id
			Site.find_by(id: site_5_id)
		else
			nil
		end
	end

	def discover_site_0
		n5 = neighbour_5
		n0 = neighbour_0
		unless site_0
			if n5 && n0
				if n5.site_2_id
					self.site_0_id = n5.site_2_id
				elsif n0.site_4_id
					self.site_0_id = n0.site_4_id
				else
					site_0_new = Site.create(
						tile_one_id: n5.id,
						tile_two_id: n0.id,
						tile_three_id: id)
					self.site_0_id = site_0_new.id
					n0.site_4_id = site_0_new.id
					n0.save
					n5.site_2_id = site_0_new.id
					n5.save
				end
			elsif !n5 && n0
				if n0.site_4_id
					self.site_0_id = n0.site_4_id
				else
					site_0_new = Site.create(
						tile_two_id: n0.id,
						tile_three_id: id)
					self.site_0_id = site_0_new.id
					n0.site_4_id = site_0_new.id
					n0.save
				end
			elsif n5 && !n0
				if n5.site_2_id
					self.site_0_id = n5.site_2_id
				else
					site_0_new = Site.create(
						tile_one_id: n5.id,
						tile_three_id: id)
					self.site_0_id = site_0_new.id
					n5.site_2_id = site_0_new.id
					n5.save
				end
			else
				site_0_new = Site.create(
					tile_three_id: id)
				self.site_0_id = site_0_new.id
			end
		end
	end


end






