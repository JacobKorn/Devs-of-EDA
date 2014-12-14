class Site < ActiveRecord::Base

has_many :tile_sites
has_many :tiles, through: :tile_sites

end
