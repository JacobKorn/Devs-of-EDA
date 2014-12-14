class TileSite < ActiveRecord::Base

	belongs_to :tile
	belongs_to :site
end
