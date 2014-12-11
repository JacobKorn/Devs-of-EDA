require 'rails_helper'

RSpec.describe Point, :type => :model do
  describe "associations" do
	  it { should have_many :tiles }
	  it { should have_many :intersections }
	end
end
