require 'rails_helper'

RSpec.describe Board do

  it { should have_many :players}

	describe "board creation" do

		it "creates 19 tiles" do
			board = Board.create
			expect(board.tiles.count).to eq(19)
		end

	end

	describe "player creation" do

    it "creates 4 players" do

    Board.destroy_all
    Tile.destroy_all
    Player.destroy_all
      @board = Board.create
      expect(@board.players.count).to eq(4)
    end

end

	describe "board player interactions" do
    let(:board) {Board.create}

		it "increments player to Player 2" do
			p2 = board.players[1]
			board.increment_player

			expect(board.current_player_id).to eq(p2.id)
		end

		it "increments player to Player 3" do
			p3 = board.players[2]
			2.times {board.increment_player}
			
			expect(board.current_player_id).to eq(p3.id)
		end
		
		it "increments player to Player 4" do
			p4 = board.players[3]
			3.times {board.increment_player}
			
			expect(board.current_player_id).to eq(p4.id)
		end
		
		it "increments player to Player 1" do
			p1 = board.players[0]
			4.times {board.increment_player}
			
			expect(board.current_player_id).to eq(p1.id)
		end

	end
end
