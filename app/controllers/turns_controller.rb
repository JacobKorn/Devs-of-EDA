class TurnsController < ApplicationController


	respond_to :json #remove

	def end_turn
		@board = Board.find(params[:board_id])
		players = @board.sorted_players

		@board.new_turn

		respond_to do |format|
			format.json { render json: players }
			format.html { render :nothing => true }
		end
	end

end
