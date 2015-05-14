class Sudoku
  def initialize(board_string)
  end

  def solve!
  end

  def board
  end
end

board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out what it can and not "guess"
game.solve!

puts game.board