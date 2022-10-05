require "singleton"

class NullPiece < Piece
    include Singleton

    def initialize(board, pos)
        super("null piece", board, nil)
        @@instance = 
    end

    def moves
        []
    end

    def symbol
        "".colorize(color)
    end
end