class Pawn < Piece
    def initialize(color, board, pos)
        super
    end

    def moves

    end

    private
    def at_start_row?
        row, col = pos
        if color == "WHITE"
            if row == 1
                return true
            else
                return false
            end
        else
            if row == 6
                return true
            else
                return false
            end
        end
    end

    def forward_dir
        if self.at_start_row?
            return 1
        else
            return -1
        end
    end

    def forward_steps
        if self.at_start_row?
            if self.color == "WHITE"
                

            end
        else

        end

        return [[1, -1], [1, 0], [2, 0], [1, 1]]
    end

    def side_attacks
        if self.color == "WHITE"
            diagonals = [[1, -1], [1, 1]]
            diagonals.each do |diagonal|
                dx, dy = diagonal
                new_pos = [pos[0] + diagonal[0], pos[1] + diagonal[1]]
            end
    end
end