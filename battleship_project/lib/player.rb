class Player
    def get_move
        puts "enter a position with coordindates separated with a space like '4 7' "
        input = gets.chomp
        return input.split.map {|el| el.to_i} 
    end

end
