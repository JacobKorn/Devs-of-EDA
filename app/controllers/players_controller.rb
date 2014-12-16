class PlayersController < ApplicationController

	def conduct_ee_session
		player = Player.find(params[:id])
		if player.conduct_ee_session
			render json: player
		else 
			render nothing: true, status: :bad_request
		end
	end

end
