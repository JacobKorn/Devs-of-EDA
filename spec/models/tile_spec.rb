require 'rails_helper'

RSpec.describe Tile, :type => :model do

	describe "associations" do
		
		it "returns tile_one from relationship" do
			a = Tile.create
			b = Tile.create

			c = Neighbour.create(tile_one_id: a.id, tile_two_id: b.id)
			expect(c.tile_one).to eq(a)
		end

		it "it turns tile_two from relationship" do
			a = Tile.create
			b = Tile.create

			c = Neighbour.create(tile_one_id: a.id, tile_two_id: b.id)
			expect(c.tile_two).to eq(b)
		end


	end
	describe "Returning neighbours" do

		it	"returns 'neighbours' correctly" do
			board = Board.create
			board.populate
			tile = Tile.where(board_id: board.id, x: 0, y: 0).first
			n1 = Tile.where(board_id: board.id, x: -1, y: 1).first
			n2 = Tile.where(board_id: board.id, x: 0, y: 1).first
			n3 = Tile.where(board_id: board.id, x: 1, y: 0).first
			n4 = Tile.where(board_id: board.id, x: 1, y: -1).first
			n5 = Tile.where(board_id: board.id, x: 0, y: -1).first
			n6 = Tile.where(board_id: board.id, x: -1, y: 0).first
			expect([
				tile.top_left_neighbour,
				tile.top_right_neighbour,
				tile.right_neighbour,
				tile.bottom_right_neighbour,
				tile.bottom_left_neighbour,
				tile.left_neighbour,
				]).to eq([n1, n2, n3, n4, n5, n6])
		end

		it "returns nil for an edging hex" do
			board = Board.create
			board.populate
			tile = Tile.where(board_id: board.id, x: -2, y: 0).first
			expect(tile.left_neighbour).to eq(nil)
		end
	
	end

end
