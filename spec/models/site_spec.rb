require 'rails_helper'

RSpec.describe Site, :type => :model do

	describe "associations" do
		it { should have_many :tiles }
		it { should have_many :tile_sites }
	end

end
