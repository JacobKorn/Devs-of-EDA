class Board	< ActiveRecord::Base

	TILE_COORDS = {
		-2 => [         0, 1, 2 ],
		-1 => [    	-1, 0, 1, 2	],
		 0 => [ -2, -1, 0, 1, 2 ],
		 1 => [ -2, -1, 0, 1 		],
		 2 => [ -2, -1, 0				]
	}


	has_many :tiles
	has_many :players

	TILE_RESOURCE = {
		"fish_and_chip_shop"     => :fish_and_chips,
		"coffee_shop"       => :coffee,
		"liquor_shop"   => :haagen,
		"pizza_shop" => :pizza,
		"bed"			 => :sleep
	}

	def populate
		chit_numbers = [2, 3, 3, 4, 4, 5, 5, 6, 6, 8, 8, 9, 9, 10, 10, 11, 11, 12].shuffle
		insert_number = rand(19)
		chit_numbers.insert(insert_number, 7)
		tile_types = ["fish_and_chip_shop", "fish_and_chip_shop", "fish_and_chip_shop", "fish_and_chip_shop", "coffee_shop", "coffee_shop", "coffee_shop", "coffee_shop", "liquor_shop", "liquor_shop", "liquor_shop", "pizza_shop", "pizza_shop", "pizza_shop", "pizza_shop", "bed", "bed", "bed"].shuffle
		tile_types.insert(insert_number, "undefined")
		TILE_COORDS.each do |x, y_group|
			y_group.each do |y|
			tiles << Tile.create(x: x, y: y, number: chit_numbers.pop, tile_type: tile_types.pop)
			end
		end
	end

	def create_players(board_id)
		4.times do
			Player.create({name: Faker::Name.first_name, board_id: board_id})
		end
	end


	def self.players(board_id)
		@players = Player.where(board_id: board_id)
	end

	def self.current_player(board_id)
																	## vvvVVVvvvVVV rewite to find actual player
		@player = Board.players(board_id).first # returning first player
	end

end
