class TilesController < ApplicationController

	def tile_clicked
		coords = params[:tileClicked]["tileId"].delete!("[]").split(',').map(&:to_i)
		@board = Board.find(params[:tileClicked]["boardId"])
		player = @board.current_player
		players = @board.sorted_players

		@tile = Tile.where(board_id: @board.id, x: coords[0], y: coords[1]).first

		tile_type = @tile.tile_type

		p "------------------------------CLICKED A TILE----"
		p player.dice_roll
		p player.clicks_left

		if player.clicks_left?
			player.increment_resource(player, tile_type) unless tile_type == "desert"
			player.decrement_clicks_left
		else
			p "++++=====<<<<<<< WWWAAHHHHHH!!"
			p "---NO CLICKS LEFT"
		end

		respond_to do |format|
			format.json { render json: players }
		end
	end



end
