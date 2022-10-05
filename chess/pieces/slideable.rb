require "byebug"

module Slideable
    HORIZONTAL_DIRS = [
        [0, 1], 
        [1, 0], 
        [0, -1], 
        [-1, 0]
    ].freeze

    DIAGONAL_DIRS = [
        [-1, 1], 
        [1, 1], 
        [1, -1], 
        [-1, -1]
    ].freeze

    def horizontal_dirs
        return HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        return DIAGONAL_DIRS
    end

    def moves
        result = []
        self.move_dirs.each do |dir|
            # dx, dy = dir
            unblocked_moves = self.grow_unblocked_moves_in_dir(*dir)
            result.concat(unblocked_moves)
        end
        result
    end

    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        result = []
        board = self.board
        pos = self.pos
        color = self.color
        next_pos = [pos[0] + dx, pos[1] + dy]
        debugger
        while board.valid_pos?(next_pos)
            if board[next_pos].empty? #NullPiece
                result << next_pos
                next_pos = [next_pos[0] + dx, next_pos[1] + dy]
            else
                if board[next_pos].color == color
                    break
                else
                    result << next_pos
                    break
                end
            end
        end
        result
    end
end