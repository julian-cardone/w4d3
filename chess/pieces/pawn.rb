require 'byebug'

class Pawn < Piece

    FORWARD_STEPS = [
        [1,0],
        [2,0]
    ].freeze

    SIDE_ATTACKS = [
        [1, -1], 
        [1, 1]
    ].freeze

    def symbol
        "♙".colorize(self.color)
    end

    def moves

        result = []

        result.concat(self.forward_steps).concat(self.side_attacks)

    end

    private
    def at_start_row?
        row, col = self.pos
        color = self.color
        if color == :white
            return row == 6 ? true : false
        else
            return row == 1 ? true : false 
        end
    end

    def forward_dir
        self.color == :white ? -1 : 1
    end

    def forward_steps
        result = []
        board = self.board
        dir = self.forward_dir

        # debugger
        steps = FORWARD_STEPS.map { |step| [dir * step[0], dir * step[1]] }

        unless self.at_start_row?
           steps =  [steps[0]]
        end

        steps.each do |step|
            new_pos = [pos[0] + step[0], pos[1] + step[1]]
            if board[new_pos].empty?
                result << new_pos
            end
        end
        return result
    end

    def side_attacks
        result = []
        board = self.board
        dir = self.forward_dir

        attacks = SIDE_ATTACKS.map { |step| [dir * step[0], dir * step[1]] }

        attacks.each do |attack|
            new_pos = [pos[0] + attack[0], pos[1] + attack[1]]
            if !board[new_pos].empty? && board[new_pos].color != color 
                result << new_pos
            end
        end
        return result
    end
end