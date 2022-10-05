require_relative 'pieces'
require 'byebug'

class Board

    def initialize
        @rows = Array.new(8){ Array.new(8) }
        @null_piece = NullPiece.instance
        self.set_up_null_pieces
        self.set_up_pieces
    end

    def set_up_null_pieces
        (2..5).each do |i|
            (0..7).each do |j|
                pos = [i,j]
                self[pos] = @null_piece
            end
        end
    end

    def set_up_row(color, piece_classes, row)
        # debugger
        piece_classes.each_with_index do |piece_class, col|
            pos = [row, col]
            piece = piece_class.new(color, self, pos)
            self.add_piece(piece, pos)
        end
    end

    def set_up_pieces
        front_row_piece_classes = [Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn]
        back_row_piece_classes = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        [:white, :black].each do |color|
            if color == :white
                front_row = 6
                back_row = 7
            else
                front_row = 1
                back_row = 0
            end
            self.set_up_row(color, back_row_piece_classes, back_row)
            self.set_up_row(color, front_row_piece_classes, front_row)
        end
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        unless self.valid_pos?(start_pos)
            raise "Start position is out of boundary!"
        end

        unless self.valid_pos?(end_pos)
            raise "End position is out of boundary!"
        end

        piece = self[start_pos]

        if piece.empty?
            raise "The position is empty!"
        end

        if piece.color != color
            raise "You can't move the opponent's piece!"
        end

        moves = piece.valid_moves

        if moves.include?(end_pos)
            self[end_pos] = piece
            self[start_pos] = @null_piece
            piece.pos = end_pos
        else
            raise "#{piece} can not move to end position!"
        end
    end

    def valid_pos?(pos)
        row, col = pos
        row.between?(0,7) && col.between?(0,7)
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def checkmate?(color)

    end

    def in_check?(color)

    end

    def find_king(color)
        (0..7).each do |i|
            (0..7).each do |j|
                pos = [i, j]
                if self[pos].is_a?(King) && self[pos].color == color
                    return pos
                end
            end
        end
        nil
    end

    def pieces
        result = []
        (0..7).each do |i|
            (0..7).each do |j|
                pos = [i, j]
                unless self[pos].empty?
                    result << self[pos]
                end
            end
        end
        result
    end

    def dup

    end

    def move_piece!(color, start_pos, end_pos)

    end

    def to_s
        board_str = ""
        @rows.each do |row|
            row_str = ""
            (0..7).each do |i|
                row_str += row[i].to_s + " "
            end
            board_str += row_str[0..-1] + "\n"
        end
        board_str
    end
end