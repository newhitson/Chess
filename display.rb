require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
  attr_reader :board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def move(new_pos)
  end

  def render
    @board.grid.each do |row|
      puts
      row.each do |tile|
        if tile.is_a?(NullPiece)
          print " N "
        else
          print " P "
        end
      end
    end
     puts"" #do not delete this seeming pointless line the last line wont render
  end

end
