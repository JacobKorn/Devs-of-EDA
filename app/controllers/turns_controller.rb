class TurnsController < ApplicationController


	respond_to :json

	def end_turn
		@board = Board.find(params[:board_id])
		@board.new_turn
		render :nothing => true
	end

end