require 'faker'

class BoardController < ApplicationController

	respond_to :json

	def create
		@board = Board.create
		@board.populate

		respond_to do |format|
			format.json { render json: @board }
		end
	end

	def show
		@board = Board.find(params)
	end

	def create_players
		4.times do
			Player.create({name: Faker::name.first_name, board_id: @board.id})
		end
	end

end
