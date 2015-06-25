require './solver'
require './board_parser'

class Sudoku
  attr_reader :grid
  def initialize(board_string)
     @grid = BoardParser.new(board_string).array
  end

  def solve!
    @solved = Solver.new(@grid).solve!
  end

  def board
    @grid.each_with_index {|l,i| puts '-' * 11 if i % 3 == 0; puts "#{l[0..2]}|#{l[3..5]}|#{l[6..8]}"}
  end
end


s = Sudoku.new(ARGV[0])
s.solve!
s.board
