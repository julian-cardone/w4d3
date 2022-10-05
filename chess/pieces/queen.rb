require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable

    def symbol
        "♕".colorize(self.color)
    end

    protected

    def move_dirs
        return self.horizontal_dirs + self.diagonal_dirs
    end
end