class PlayersController < ApplicationController

	def conduct_ee_session
		board = Board.find(params[:board_id])
		players = board.sorted_players
		player = board.current_player
		
		if player.conduct_ee_session
			render json: players
		else 
			render nothing: true, status: :bad_request
		end
	end
	
end
