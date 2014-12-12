require 'rails_helper'

RSpec.describe Board do

	describe "board creation" do

		it "creates 19 tiles" do
			board = Board.create
			board.populate
			expect(board.tiles.count).to eq(19)
		end

		
	end
end