class Sudoku
  def initialize(board_string)
    @my_board = Board.new(board_string)

  end

  def solve!
  end

  def board
    @my_board
  end

  def row_for_cell(row)
    @my_board.row_for_cell(row)
  end

  def column_for_cell(column)
    @my_board.column_for_cell(column)
  end

  def group_for_cell(row, column)
    @my_board.group_for_cell(row, column)
  end
end