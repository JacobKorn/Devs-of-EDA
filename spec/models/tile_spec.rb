require 'rails_helper'

RSpec.describe Tile, :type => :model do

	describe "associations" do
		it { should have_many :points }
		it { should have_many :intersections }
	end


end
