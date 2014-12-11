require 'rails_helper'

RSpec.describe Intersection, :type => :model do

	describe "associations" do
		it { should belong_to :tile }
		it { should belong_to :point}
	end
end
