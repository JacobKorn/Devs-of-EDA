require 'rails_helper'

RSpec.describe Tile, :type => :model do

	describe "associations" do
		it { should have_many :tile_sites }
		it { should have_many :sites }
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
				tile.neighbour_0,
				tile.neighbour_1,
				tile.neighbour_2,
				tile.neighbour_3,
				tile.neighbour_4,
				tile.neighbour_5,
				]).to eq([n1, n2, n3, n4, n5, n6])
		end

		it "returns nil for an edging hex" do
			board = Board.create
			board.populate
			tile = Tile.where(board_id: board.id, x: -2, y: 0).first
			expect(tile.neighbour_5).to eq(nil)
		end
	
	end

end
