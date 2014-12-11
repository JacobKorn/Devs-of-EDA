require 'rails_helper'

RSpec.describe Tile, :type => :model do

	describe "associations" do
		
		it "returns tile_one from relationship" do
			a = Tile.create
			b = Tile.create

			c = Neighbour.create(tile_one_id: a.id, tile_two_id: b.id)
			expect(c.tile_one).to eq(a)
		end

		it "it turns tile_two from relationship" do
			a = Tile.create
			b = Tile.create

			c = Neighbour.create(tile_one_id: a.id, tile_two_id: b.id)
			expect(c.tile_two).to eq(b)
		end

		it "relationship returned from tile_one" do
			a = Tile.create
			b = Tile.create
			c = Tile.create

			n1 = Neighbour.create(tile_one_id: a.id, tile_two_id: b.id)
			n2 = Neighbour.create(tile_one_id: c.id, tile_two_id: a.id)
			n3 = Neighbour.create(tile_one_id: a.id, tile_two_id: c.id)

			expect(a.neighbours).to eq([b,c])
		end

	end


end
