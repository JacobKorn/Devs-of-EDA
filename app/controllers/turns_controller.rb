class TurnsController < ApplicationController


	def end_turn
		@board = Board.find(params[:board_id])

		unless @board.check_winner?
			@board.new_turn
			p "NEW TURN"

		else
			p "THERS A WINNER"
		end

		players = @board.sorted_players(true)
		respond_to do |format|
			format.json { render json: players, root: "players" }
			format.html { render :nothing => true }
		end
	end

end
