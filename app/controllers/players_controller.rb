class PlayersController < ApplicationController

	def conduct_ee_session
		board = Board.find(params[:board_id])
		player = board.current_player
		
		
		if player.conduct_ee_session
			players = board.sorted_players
			render json: players
		else 
			render nothing: true, status: :bad_request
		end
	end
	
end
