class TilesController < ApplicationController

	def click_tile
		p "--------totes clicked----------"
		p params[:tileClicked]
	end

end