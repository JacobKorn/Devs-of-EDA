require 'faker'

class BoardsController < ApplicationController

	respond_to :json

	def index
		@boards = Board.all
	end

	def new
		
	end

	def create
		@board = Board.create
		@board.populate
		@board.create_players(@board.id)

		respond_to do |format|
			format.json { render json: @board }
		end
	end

	def show
		@board = Board.find(params[:id])

		respond_to do |format|
			format.html { render :show }
			format.json { render json: @board }
		end
	end

	

end
