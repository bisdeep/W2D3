require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)#nxn board
        @player = Player.new()
        @size = n * n
        @board = Board.new(n)
        @remaining_misses = @size / 2
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print #as it says so explicitly in the rspec
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose :("
            return true
        else
            return false
        end

    end

    def win?
        if @board.num_ships == 0
            puts "you win!"
            return true
        else
            return false
    end
end

    def game_over?
        return true if (win?) || (lose?)
        return false
    end

    def turn
        position = @player.get_move()
        if @board.attack(position) == false
            @remaining_misses -= 1
        end
        @board.print
        puts "Number of remaining misses: "+ @remaining_misses.to_s

    end

end
