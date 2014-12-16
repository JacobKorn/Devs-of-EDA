class PlayersController < ApplicationController

	def conduct_ee_session
		# player = Board.find(params[:board_id])
		player = Board.current_player(params[:board_id])
		if player.conduct_ee_session
			render json: player
		else 
			render nothing: true, status: :bad_request
		end
	end

end
