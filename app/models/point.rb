class Point < ActiveRecord::Base

	has_many :intersections
	has_many :tiles, through: :intersections
end
