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

  def temp_play
    while 1 < 2
      render
      @cursor.get_input
    end
  end

  def render
    system("clear")
    @board.grid.each_with_index do |row, idx1|
      row.each_with_index do |tile, idx2|
        if tile.is_a?(NullPiece)
          [idx1, idx2] == @cursor.cursor_pos ? (print " N ".colorize(:background => :yellow, :color => :red)) : (print " N ".colorize(:red))
        else
          [idx1, idx2] == @cursor.cursor_pos ? (print " P ".colorize(:yellow)) : (print " P ".colorize(:blue))
        end
      end
      puts ""
    end
    nil
  end

end
