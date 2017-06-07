require_relative 'piece.rb'

class Board
  attr_accessor :board, :grid
  def initialize
    @grid = Array.new(8){ Array.new(8){nil}}
    piece_setup
  end

  def piece_setup

    # make_board = Array.new(8){ Array.new(8){nil}}
    @grid.each_with_index do |row, idx1|
      row.each_with_index do |_, idx2|
        case idx1
        when 0,1
          @grid[idx1][idx2] = Rook.new(self,[idx1,idx2],:white)
        when 6,7
          @grid[idx1][idx2] = Rook.new(self,[idx1,idx2],:black)
        else
          @grid[idx1][idx2] = NullPiece.new(self,[idx1,idx2],:empty)
        end
      end
    end
  end

  def in_bounds(pos)
    return true if pos[0].between?(0,7) && pos[1].between?(0,7)
    false
  end

  def move_piece(start_pos, end_pos)
    raise OffBoardError.new "Location not on board" unless end_pos[0].between?(0,7) && end_pos[0].between?(0,7)
    val_at_start = self[start_pos]
    val_at_end = self[end_pos]


    raise NotAPieceError.new "Thats not a piece!!!!" if val_at_start.is_a?(NullPiece)
    self[end_pos] = val_at_start
    self[start_pos] = val_at_end

  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x,y = pos
    @grid[x][y] = piece
  end


end

class OffBoardError < StandardError
end
class NotAPieceError < StandardError
end
