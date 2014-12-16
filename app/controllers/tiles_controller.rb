class TilesController < ApplicationController

	def tile_clicked
		coords = params[:tileClicked]["tileId"].delete!("[]").split(',').map(&:to_i)
		@board = Board.find(params[:tileClicked]["boardId"])
		p "------------------------------CLICKED A TILE----"
		p @board
		@tile = Tile.where(board_id: @board.id, x: coords[0], y: coords[1]).first

		player = @board.current_player
		p player
		tile_type = @tile.tile_type

		player.increment_resource(player, tile_type) unless tile_type == "desert"
		respond_to do |format|
			format.json { render json: player}
		end
	end



end