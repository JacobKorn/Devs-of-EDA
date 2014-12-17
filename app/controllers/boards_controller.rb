require 'faker'

class BoardsController < ApplicationController



	def index
		@boards = Board.all
	end

	def new
		
	end

	def create
		@board = Board.create
		id = @board.id
		@board = Board.find(id)
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
