class Tile < ActiveRecord::Base

	belongs_to :board

	has_many :neighbours 

	def top_left_neighbour
		Tile.where(board_id: board_id, x: x - 1, y: y + 1).first
	end

	def top_right_neighbour
		Tile.where(board_id: board_id, x: x, y: y + 1).first
	end

	def right_neighbour
		Tile.where(board_id: board_id, x: x + 1, y: y).first
	end

	def bottom_right_neighbour
		Tile.where(board_id: board_id, x: x + 1, y: y - 1).first
	end

	def bottom_left_neighbour
		Tile.where(board_id: board_id, x: x, y: y - 1).first
	end	

	def left_neighbour
		Tile.where(board_id: board_id, x: x - 1, y: y).first
	end	


end
