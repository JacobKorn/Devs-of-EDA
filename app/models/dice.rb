module Dice
	
	def roll
	dice_1 = rand(6) + 1
	dice_2 = rand(6) + 1

	total = dice_1 + dice_2
	end

	module_function :roll 

end