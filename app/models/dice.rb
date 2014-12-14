def roll
    dice_1 = rand(6) + 1
    dice_2 = rand(6) + 1

    total = dice_1 + dice_2

    puts "dice 1 - #{dice_1}, dice 2 = #{dice_2}, total = #{total}"

end
