class Sudoku
  BOARD_SIZE = 9

  def initialize(board_string)
    @board_string = board_string

    populate_cells
  end

  def solve!
  end

  def board
    board_out = ''
    @cells.each_with_index do |cell, idx|
      if (idx + 1) % 9 == 0
        board_out << "#{cell.value}\n"
      else
        board_out << "#{cell.value} "
      end
    end
    board_out
  end

  def row_for_cell(cell)
    cells.select{|c| c.in_row?(cell)}
  end

  def column_for_cell(cell)
    cells.select{|c| c.in_column?(cell)}
  end

  def cell_at(coordinate)
    cells.find{|c| c.coordinate == coordinate}
  end

  private

  attr_accessor :cells, :board_string

  def populate_cells
    self.cells = []

    BOARD_SIZE.times do |y|
      BOARD_SIZE.times do |x|
        @cells << Cell.new(value: board_string[BOARD_SIZE*y + x].to_i, coordinate: Coordinate.new(x: x, y: y))
      end
    end
  end
end

class Coordinate
  def initialize(x:, y:)
    @x = x
    @y = y
  end

  attr_reader :x, :y

  def ==(other)
    other.x == x && other.y == y
  end

  def in_row?(other_coordinate)
    other_coordinate.y == y
  end

  def in_column?(other_coordinate)
    other_coordinate.x == x
  end
end

class Cell
  attr_accessor :value
  attr_reader :coordinate

  def initialize(value:, coordinate:)
    @value = value
    @coordinate = coordinate
  end

  def in_row?(other_cell)
    coordinate.in_row?(other_cell.coordinate)
  end

  def in_column?(other_cell)
    coordinate.in_column?(other_cell.coordinate)
  end
end
