module Steppable
    def moves
        result = []
        self.move_diffs.each do |diff|
            board = self.board
            pos = self.pos
            color = self.color
            next_pos = [pos[0] + diff[0], pos[1] + diff[1]]
            if board.valid_pos?(next_pos)
                if board[next_pos].empty? #NullPiece
                    result << next_pos
                else
                    if board[next_pos].color == color
                        next
                    else
                        result << next_pos
                        next
                    end
                end
            end
        end
        result
    end

    private

    def move_diffs
        raise NotImplementedError
    end
end