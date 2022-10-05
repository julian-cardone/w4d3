require "singleton"

class NullPiece < Piece
    include Singleton

    def initialize
        super(" ", nil, nil)
    end

    def moves
        []
    end

    def symbol
        " ".colorize(self.color)
    end
end