class TilesController < ApplicationController

	def tile_clicked
		coords = params[:tileClicked]["tileId"].delete!("[]").split(',').map(&:to_i)
		board_id = params[:tileClicked]["boardId"]
		p "------------------------------CLICKED A TILE----"
		@tile = Tile.where(board_id: board_id, x: coords[0], y: coords[1]).first

		player = Board.current_player(board_id)
		p player
		tile_type = @tile.tile_type
		player.increment_resource(player, tile_type)

		respond_to do |format|
			format.json { render json: player}
		end
	end



end