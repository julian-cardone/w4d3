require_relative 'piece.rb'

class Board

    def initialize
        @rows = Array.new(8){ Array.new(8) }
        self.set_up_pieces
        self.set_up_null_pieces
    end

    def set_up_pieces
        # queen_pos = []
        # rook_pos = []
        # knight_pos = []
        # queen_pos = []
        # rook_pos = []
        # knight_pos = []
        # self[queen_pos] = Queen.new
        # self[rook_pos] = Rook.new
        # self[knight_pos] = Knight.new
        # self[queen_pos] = Queen.new
        # self[rook_pos] = Rook.new
        # self[knight_pos] = Knight.new
        white_queen = Piece.new
        black_queen = Piece.new

        black_knight_1 = Piece.new
        black_knight_2 = Piece.new
        white_knight_1 = Piece.new
        white_knight_2 = Piece.new

        black_rook_1 = Piece.new
        black_rook_2 = Piece.new
        white_rook_1 = Piece.new
        white_rook_2 = Piece.new


        self[[0,3]] = black_queen
        self[[7,3]] = white_queen

        self[[0,1]] = black_knight_1
        self[[0,6]] = black_knight_2
        self[[7,1]] = white_knight_1
        self[[7,6]] = white_knight_2

        self[[0,0]] = black_rook_1
        self[[0,7]] = black_rook_2
        self[[7,0]] = white_rook_1
        self[[7,7]] = white_rook_2

    end

    def set_up_null_pieces
        # null_pieces_positions = []
        # null_pieces_positions.each do |pos|
        #     #self[pos] = NullPiece.new
        #     self[pos] = nil

        # end
        (2..5).each do |i|
            (0..7).each do |j|
                pos = [i,j]
                self[pos] = nil
            end
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

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        if piece == nil
             raise "exception"
        else
            self[end_pos] = piece
            self[start_pos] = nil
        end
            # moves = piece.moves
            # end_positions = moves.map { |move| process(start_pos, move) }
            # if end_positions.include?(end_pos)
            #     self[end_pos] = piece
            # else
            #     raise "Can not move to #{end_pos}"
            # end
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

    end

    def pieces

    end

    def dup

    end

    def move_piece!(color, start_pos, end_pos)

    end

end