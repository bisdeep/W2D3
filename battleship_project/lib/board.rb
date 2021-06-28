class Board

    def initialize(n)
        @grid = Array.new(n) { (Array.new(n, :N)) }
        #we create distinct subarrays by declaring the array this way 
        #passing in the subarrays as an array.new within a block
        @size = n * n
        
    end

    def size 
        @size
    end

    def [](position)
        # row = position[0]
        # col = position[1]
        row, col = position #position will be an array with 2 indexes, set the 2 indexes accordingly as row and col
        @grid[row][col]
    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count{|el| el == :S}
    end

    def attack(position)
        #Check an instance of the board with self
        if self[position] == :S
            self[position] = :H #for hit
            puts "you sunk my battleship!"
            return true
        
        else
            self[position] = :X #miss
            return false
        end

    end

    def place_random_ships
        #individually find random row and col to place the ship on
        #do this grid.size * 25% times
        total_ships = @size * 0.25

        while self.num_ships < total_ships
            #get random row and random col
            randomRow = rand(0...@grid.length)
            randomCol = rand(0...@grid.length)
            position = [randomRow, randomCol]
            #set position as ship,
            #which increments ship count on the self and allows us 
            #to keep incrementing till we have 25% of the board with 
            #ships placed randomly
            self[position] = :S
        end
    end

    def hidden_ships_grid #in order to write a new grid, we should map over our current
        #in order to map over th current grid, we need to see our grid
        #as an array of rows, so we need to map the elements in the rows and then the rows, to get the proper subarays 
        @grid.map do |row|
            row.map do |el|
                if el == :S
                    :N
                else
                    el
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end

    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


    
end
