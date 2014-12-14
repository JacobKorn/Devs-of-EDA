class TilesController < ApplicationController

	def click_tile
		coords = params[:tileClicked]["tileId"].delete!("[]").split(',').map(&:to_i)
		board_id = params[:tileClicked]["boardId"]
		@tile = Tile.where(board_id: board_id, x: coords[0], y: coords[1]).first
		p "--------totes clicked----------"
		p @tile
		p "--------totes clicked----------"
	end

end