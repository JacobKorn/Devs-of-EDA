require 'rails_helper'

RSpec.describe Board do

	describe "board creation" do

		xit "creates 19 tiles" do

		end

		describe "returning tile's row" do
			it "first row returns correctly" do
				board = Board.create
				board.create_board
				expect([
					board.tiles[0].row?,
					board.tiles[1].row?,
					board.tiles[2].row?]
					).to eq([0,0,0])
			end

			it "second row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.tiles[3].row?,
					board.tiles[4].row?,
					board.tiles[5].row?,
					board.tiles[6].row?]
					).to eq([1,1,1,1])
			end

			it "third row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.tiles[7].row?,
					board.tiles[8].row?,
					board.tiles[9].row?,
					board.tiles[10].row?,
					board.tiles[11].row?]
					).to eq([2,2,2,2,2])
			end

			it "forth row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.tiles[12].row?,
					board.tiles[13].row?,
					board.tiles[14].row?,
					board.tiles[15].row?]
					).to eq([3,3,3,3])
			end

			it "fifth row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.tiles[16].row?,
					board.tiles[17].row?,
					board.tiles[18].row?]
					).to eq([4,4,4])
			end
		end
	end
end