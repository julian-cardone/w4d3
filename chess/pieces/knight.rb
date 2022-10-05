require_relative "piece"
require_relative "steppable"

class Knight
    include Steppable

    KNIGHT_DIFFS = [
        [-2, 1], 
        [-1, 2], 
        [1, 2], 
        [2, 1], 
        [2, -1], 
        [1, -2], 
        [-1, -2], 
        [-2,-1]
    ]

    def symbol
        "♘".colorize(self.color)
    end

    protected

    def move_diffs
        KNIGHT_DIFFS
    end
end