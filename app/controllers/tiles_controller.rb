class TilesController < ApplicationController

	def tile_clicked
		coords = params[:tileClicked]["tileId"].delete!("[]").split(',').map(&:to_i)
		@board = Board.find(params[:tileClicked]["boardId"])
		player = @board.current_player

		@tile = Tile.where(board_id: @board.id, x: coords[0], y: coords[1]).first

		tile_type = @tile.tile_type

		p "------------------------------CLICKED A TILE----"
		p player.dice_roll
		p player.clicks_left

		if player.clicks_left? && !@board.check_winner?
			player.increment_resource(player, tile_type) unless tile_type == "desert"
			player.decrement_clicks_left
		else
			p "++++=====<<<<<<< WWWAAHHHHHH!!"
			p "---NO CLICKS LEFT or someone won"
		end

		players = @board.sorted_players(true)
		respond_to do |format|
			format.json { render json: players, root: "players" }
		end
	end



end
