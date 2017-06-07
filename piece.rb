require 'byebug'
module SlidingPiece
  def hor_moves
    [[0,1],[0,-1],[1,0],[-1,0]]
  end

  def ver_moves
    [[1,-1],[1,1],[-1,-1],[-1,1]]
  end
end

class Piece
  attr_reader :board, :color, :location
  def initialize(board,location, color = :white)
    @board = board
    @location = location
    @color = color

  end

  def moves()
  end

end

class Rook < Piece
  extend SlidingPiece

  def move
    result = []
    [[0,1],[0,-1],[1,0],[-1,0]].each do |move|
      my_pos = @location
      until  my_pos.all? { |pos| pos.between?(0, 7)}
        my_pos = [my_pos[0] + move[0], my_pos[1] + move[1]]
        #break if @board[my_pos].color == self.color
        result << my_pos
      end
    result
    end
  end


end

class NullPiece < Piece


end


# def my_location
#   @board.grid.each_with_index do |row, idx1|
#     row.each_with_index do |_, idx2|
#       if @board[[idx1, idx2]] == self
#         @location = [idx1, idx2]
#         return @location
#       end
#     end
#   end
# end
