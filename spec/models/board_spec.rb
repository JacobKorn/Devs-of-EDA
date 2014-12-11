require 'rails_helper'

RSpec.describe Board do

	describe "board creation" do

		xit "creates 19 tiles" do

		end

		describe "returning tile's row" do
			it "first row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.row?(board.tiles[0]),
					board.row?(board.tiles[1]),
					board.row?(board.tiles[2])]
					).to eq([0,0,0])
			end

			it "second row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.row?(board.tiles[3]),
					board.row?(board.tiles[4]),
					board.row?(board.tiles[5]),
					board.row?(board.tiles[6])]
					).to eq([1,1,1,1])
			end

			it "third row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.row?(board.tiles[7]),
					board.row?(board.tiles[8]),
					board.row?(board.tiles[9]),
					board.row?(board.tiles[10]),
					board.row?(board.tiles[11])]
					).to eq([2,2,2,2,2])
			end

			it "forth row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.row?(board.tiles[12]),
					board.row?(board.tiles[13]),
					board.row?(board.tiles[14]),
					board.row?(board.tiles[15])]
					).to eq([3,3,3,3])
			end

			it "fifth row returns correctly" do
				board = Board.new
				board.create_board
				expect([
					board.row?(board.tiles[16]),
					board.row?(board.tiles[17]),
					board.row?(board.tiles[18])]
					).to eq([4,4,4])
			end
		end
	end
end