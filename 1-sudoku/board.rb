class Board

  attr_reader :rows

  def initialize(board_string)
    @rows = Array.new(9){Array.new(9)}
    build_cells(board_string)
  end

  def row_for_cell(row)
    @rows[row]
  end

  def column_for_cell(column)
    @rows.transpose[column]
  end

  def group_for_cell(row, column)
    chosenRows = Array.new

    case row
    when 0..2
      chosenRows += @rows[0..2]
    when 3..5
      chosenRows += @rows[3..5]
    when 6..8
      chosenRows += @rows[6..8]
    end

    chosenGroup = chosenRows.transpose
    group = Array.new

    case column
    when 0..2
      group << chosenGroup[0..2]
    when 3..5
      group << chosenGroup[3..5]
    when 6..8
      group << chosenGroup[6..8]
    end

    group.flatten.sort
  end

  def valid_game?
  end

  def build_cells(board_string)
    array = board_string.split("")
    built_rows = Array.new

    9.times do |i|
      built_rows << array.slice(i*9, 9)
    end

    built_rows.each_with_index do |row, i|
      row.each_with_index do |number, j|
        if number == 0
          @rows[i][j] = EmptyCell.new(number.to_i)
        else
          @rows[i][j] = StartingCell.new(number.to_i)
        end
      end
    end
  end

end