require 'rails_helper'

RSpec.describe Tile, :type => :model do

	describe "associations" do
		it { should have_many :tile_sites }
		it { should have_many :sites }
	end

	
	describe "Returning neighbours" do

		it	"returns 'neighbours' correctly" do
			board = Board.create
			board.populate
			tile = Tile.where(board_id: board.id, x: 0, y: 0).first
			n1 = Tile.where(board_id: board.id, x: -1, y: 1).first
			n2 = Tile.where(board_id: board.id, x: 0, y: 1).first
			n3 = Tile.where(board_id: board.id, x: 1, y: 0).first
			n4 = Tile.where(board_id: board.id, x: 1, y: -1).first
			n5 = Tile.where(board_id: board.id, x: 0, y: -1).first
			n6 = Tile.where(board_id: board.id, x: -1, y: 0).first
			expect([
				tile.neighbour_0,
				tile.neighbour_1,
				tile.neighbour_2,
				tile.neighbour_3,
				tile.neighbour_4,
				tile.neighbour_5,
				]).to eq([n1, n2, n3, n4, n5, n6])
		end

		it "returns nil for an edging hex" do
			board = Board.create
			board.populate
			tile = Tile.where(board_id: board.id, x: -2, y: 0).first
			expect(tile.neighbour_5).to eq(nil)
		end
	end

	describe "sites" do

		it "returns nil for empty sites" do
			t = Tile.new
			expect([
				t.site_0,
				t.site_1,
				t.site_2,
				t.site_3,
				t.site_4,
				t.site_5
				]).to eq([nil,nil,nil,nil,nil,nil])
		end

		it "returns the site if it is present" do
			t = Tile.create
			s = Site.create
			t.site_0_id = s.id
			expect(t.site_0).to eq(s)
		end

		it "make a site for three hexes on site 0" do
			b = Board.create
			b.populate
			t = b.tiles[5]
			t.discover_site_0
			expect(t.site_0).to be_truthy
		end

		it "a new site on site 0 is shared with neighbours 5 and 0" do
			b = Board.create
			b.populate
			t = b.tiles[5]
			t.discover_site_0
			expect([
				t.neighbour_5.site_2,
				t.neighbour_0.site_4
				 ]).to eq([t.site_0, t.site_0])
		end

		it "still assigns a site if there are no neighbours" do
			b = Board.create
			b.populate
			t = b.tiles[0]
			p "---Putting t----"
			p t
			p "---Putting t.neighbour_0----"
			p t.neighbour_0
			t.discover_site_0
			p "---Putting t.site_0----"
			p t.site_0

			expect(t.site_0).to be_truthy

		end

		it "shouldn't allocate a site on point 0 if it already has one" do
			b = Board.create
			s = Site.create
			b.populate
			t = b.tiles[5]
			t.site_0_id = s.id
			t.discover_site_0
			expect(t.site_0).to eq(s)
		end

		it "site_0: if neighbour_5 has site__2 defined, use that" do
			b = Board.create
			s = Site.create
			b.populate
			t = b.tiles[5]
			n5 = t.neighbour_5
			n5.site_2_id = s.id
			n5.save

			t.discover_site_0
			expect(t.site_0).to eq(s)
		end

		it "site_0: if neighbour_0 has site__4 defined, use that" do
			b = Board.create
			s = Site.create
			b.populate
			t = b.tiles[5]
			n0 = t.neighbour_0
			n0.site_4_id = s.id
			n0.save

			t.discover_site_0
			expect(t.site_0).to eq(s)
		end

	end

end
