class Board	< ActiveRecord::Base

	TILE_COORDS = {
		-2 => [         0, 1, 2 ],
		-1 => [    	-1, 0, 1, 2	],
		 0 => [ -2, -1, 0, 1, 2 ],
		 1 => [ -2, -1, 0, 1 		],
		 2 => [ -2, -1, 0				]
	}

	after_create :bootstrap

	has_many :tiles
	has_many :players

	TILE_RESOURCE = {
		"fish_and_chip_shop" 	=> :fish_and_chips,
		"coffee_shop"       	=> :coffee,
		"liquor_shop"   			=> :haagen,
		"pizza_shop" 					=> :pizza,
		"bed"			 						=> :sleep
	}

	def bootstrap
		self.populate
		self.create_players
		self.set_first_player
		self.set_starting_roll
	end

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

	def create_players
		@players = ["Alex", "Anthony", "Eugene", "Gabby", "Georgie", "Kat", "Rob", "Sarah", "Steve", "Tye"]

		4.times do
			@player_name = @players.shuffle!.pop
			Player.create({name: @player_name, board_id: id})
		end
	end

	def sorted_players
		players.sort_by { |player| player.id }
	end

	def starting_player
		sorted_players.first
	end

	def set_first_player
		self.current_player_id = starting_player.id
		self.save
	end

	def set_starting_roll
		starting_player.roll_dice
	end

	def set_current_player(index)
		self.current_player_id = sorted_players[index].id
		self.save
	end

	def new_turn
		increment_player
		current_player.roll_dice
	end


	def increment_player
		player_count = sorted_players.length - 1
		current_player_index = sorted_players.index(current_player)
		if current_player_index < player_count
			set_current_player(current_player_index + 1)
		else
			set_current_player(0)
		end
	end

	def current_player
		@player = Player.find(current_player_id)
	end

end
