require_relative 'piece.rb'

class Board
  attr_reader :board, :grid
  def initialize
    @grid = Board.piece_setup
  end

  def self.piece_setup
    make_board = Array.new(8){Array.new(8){nil}}
    make_board.each_with_index do |row, idx1|
      row.each_with_index do |tile, idx2|
        if idx1 > 1 && idx1 < 6
          make_board[idx1][idx2] = NullPiece.new
        else
          make_board[idx1][idx2] = Piece.new
        end
      end
    end
    make_board
  end


  def board_in_bound

  end

  def move_piece(start_pos, end_pos)
    raise OffBoardError.new "Location not on board" unless end_pos[0].between?(0,7) && end_pos[0].between?(0,7)
    val_at_start = @grid[start_pos[0]][start_pos[1]]
    val_at_end = @grid[end_pos[0]][end_pos[1]]


    raise NotAPieceError.new "Thats not a piece!!!!" if val_at_start.is_a?(NullPiece)
    @grid[end_pos[0]][end_pos[1]] = val_at_start
    @grid[start_pos[0]][start_pos[1]] = val_at_end

  end

  # def [](pos)
  #   x,y = pos
  #   @grid[x][y]
  # end
  #
  # def []=(pos, piece)
  #   x,y = pos
  #   @grid[x][y] = piece
  # end


end

class OffBoardError < StandardError
end
class NotAPieceError < StandardError
end
