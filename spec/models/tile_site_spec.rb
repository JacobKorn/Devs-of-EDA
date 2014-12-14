require 'rails_helper'

RSpec.describe TileSite, :type => :model do

	describe "associations" do
		it { should belong_to :tile }
		it { should belong_to :site }
	end

end
