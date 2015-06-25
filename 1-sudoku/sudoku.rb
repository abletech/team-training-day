require 'pry'

class Sudoku

  attr_accessor :board_string, :cells, :rows, :columns, :boxes

  def initialize(board_string)
    @board_string = board_string
    @cells = []
    @rows = []
    @columns = []
    @boxes = []
  end

  def solve!
    setup_board
  end

  def board
    board_output = "\n---------------------\n"
    cells.each_with_index do |cell,i|
      is_third_column = (i % 3 == 0) && (i != 0) && (i % 9 != 0)
      is_third_row = i % 27 == 0 && i != 0
      is_end_of_row = i % 9 == 0 && i != 0

      board_output += "| " if is_third_column
      board_output += "\n---------------------" if is_third_row
      board_output += "\n" if is_end_of_row
      board_output += "#{cell.value ? cell.value : " "} "
    end
    board_output += "\n---------------------\n"
    board_output
  end

  private

  def setup_board
    @cells = board_string.chars.collect do |value|
      Cell.new(value)
    end


    @cells.each_with_index do |cell, index|
      rows[index / 9] ||= Group.new
      rows[index / 9].add_cell(cell)
      cell.add_group(rows[index / 9])
      columns[index % 9] ||= Group.new
      columns[index % 9].add_cell(cell)
      cell.add_group(columns[index % 9])
    end
    rows.each_with_index do |row,row_index|
      row.each_with_index do |cell,cell_index|
        @boxes[cell_index/3+row_index/3] ||= Group.new
        @boxes[cell_index/3+row_index/3].add_cell(cell)
        cell.add_group(@boxes[cell_index/3+row_index/3])
      end
    end
  end
end

class Group
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def add_cell(cell)
    cells << cell
  end
end

class Cell

  attr_accessor :value, :groups

  def initialize(value)
    @value = value unless value == '0'
    @groups = []
  end

  def add_group(group)
    @groups << group
  end


end
