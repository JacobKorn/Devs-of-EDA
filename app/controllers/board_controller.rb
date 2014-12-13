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
	
end

end