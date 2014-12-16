require 'rails_helper'

RSpec.describe Dice do

	describe "player dice interactions" do
    let(:board) {Board.create}
    let(:player) {board.current_player}
    let(:starting_player) {board.starting_player}

    it "returns a number between 2-12" do
    	expect(player.roll_dice).to be_between(2, 12).inclusive
    end

    it "saves dice roll to current player" do
      expect(player.dice_roll).to be_between(2, 12).inclusive
    end

    it "saves dice roll to starting player" do
    	board.set_starting_roll
    	expect(starting_player.dice_roll).to be_between(2, 12).inclusive
    end
	end

end