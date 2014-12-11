class Tile < ActiveRecord::Base

	has_many :intersections
	has_many :points, through: :intersections
end
