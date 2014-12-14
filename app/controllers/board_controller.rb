require 'faker'

class BoardController < ApplicationController

	respond_to :json

	def create
		@board = Board.create
		@board.populate
		@board.create_players(@board.id)

		respond_to do |format|
			format.json { render json: @board }
		end
	end

	def show
		@board = Board.find(params)
	end

	

end
