require 'rails_helper'
require 'faker'

RSpec.describe BoardsController, :type => :controller do

  describe "player creation" do

    it "creates 4 players" do

    Board.destroy_all
    Tile.destroy_all
    Player.destroy_all
      @board = Board.create
      @board.save
      4.times do
        Player.create({name: Faker::Name.first_name, board_id: @board.id})
      end
      expect(Player.all.count).to eq(4)
    end

end

end
