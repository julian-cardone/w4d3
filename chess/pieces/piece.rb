class Piece
    attr_reader :color
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    # def initialize
    # end

    def move

    end

    def to_s
        self.symbol
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        
    end

    def pos=(val)
        @pos = val
    end

    def Symbol

    end

    private
    def move_into_check?(end_pos)
        
    end

end