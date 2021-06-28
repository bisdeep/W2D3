class Board
    attr_reader :grid
    @@grid = Array.new(3) {Array.new(3, "_")}
    #the var shared by all instances of the board
    #every TTT game will be in a 3 x 3 grid
    
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

    def initialize
        @grid = @@grid #create an instance variable based on the class variable,
    end

    def valid?(position)#position is [i, j]
        #if there any elements over 2, we are out of bounds in position
        position.all? {|el| (el <= 2) && (el >= 0 )}
        #are all the elements in the position array, 
        #elements such that it they are less than 
        #or equal to 2
    end

    def empty?(position)
        # row, col = position
        if self[position] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        #place mark only it is empty
        if ! ((empty?(position)) && (valid?(position)))
            raise
            "Position invalid"
        else
            self[position] = mark
        end
    end

    def print
        @grid.each do |row|
            puts row.join("|")
        end
    end

    def win_row(mark)
        #go through each row
        #if there are 3 counts of the mark in any row 
        #return true

    end

    def win_col(mark)

    end

    def win_diagonal?(mark)

    end

    def win?(mark)

    end

    def empty_positions?
    end


#as long as we are able to print both the class grid and instance grids, we know we are doing okay
    #  p @@grid
    #  board = Board.new()
    #  p board.grid

end