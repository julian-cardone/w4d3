require_relative "piece"
require_relative "steppable"

class King
    include Steppable

    KING_DIFFS = [
        [-1, 0],
        [-1, 1],
        [0, 1],
        [1, 1],
        [1, 0],
        [1, -1],
        [0, -1],
        [-1, -1]
    ]

    def symbol
        "♔".colorize(self.color)
    end

    protected

    def move_diffs
        KING_DIFFS
    end
end