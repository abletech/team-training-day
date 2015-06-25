class Sudoku
  attr_reader :board, :starting_board
  def initialize(board_string)
    # create the board arrays
    @starting_board = board_string.chars.each_slice(9).to_a
    @board = @starting_board.clone
    # set solved state
  end

  def solve!

    starting_board.each_with_index do |row, y|
      row.each_with_index do |c, x|
        if c == '0'
          cell = Cell.new(y: y, x: x)
          unless c = possible_numbers_for_cell(cell).sample
            raise "Error"
          end
        end
        board[y][x] = c
      end
    end
    print_board
    # iterate around board
    # when we find a '0', choose from the possible numbers for cell
    # if no numbers, we failed.
  end

  def print_board

    board.each_with_index do | row, index |
      if index % 3 == 0
        puts "----------------------------------------"
      end

      puts row.to_s
    end
  end

  def possible_numbers_for_cell(cell)
    (1..9).to_a - row_for_cell(cell) - column_for_cell(cell) - square_for_cell(cell)
  end

  def row_for_cell(cell)
    board[cell.y]
  end

  def column_for_cell(cell)
    board.transpose[cell.x]
  end

  def square_for_cell(cell)
    square_y = (cell.y / 3) * 3
    square_x = (cell.x / 3)

    square = []
    (0..2).each do |i|
      square << board[square_y+i].each_slice(3).to_a[square_x]
    end

    square.flatten
  end

end

class Cell
  attr_reader :x, :y
  def initialize(y:, x:)
    @y = y
    @x = x
  end
end