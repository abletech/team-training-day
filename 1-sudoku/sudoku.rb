class Sudoko
  attr_accessor :board, :new_info, :rows, :columns, :boxes

  def initialize(board_string)
    row_count=0
    col_count=0
    box_count=0
    @board = []


    @rows = 9.times.collect{ 9.times.collect { false }}
    @columns = 9.times.collect{ 9.times.collect { false }}
    @boxes = 9.times.collect{ 9.times.collect { false }}

    board_string.split('').each do |num|
      number = num.to_i
      @board << Square.new(rows[row_count], columns[col_count], boxes[box_count], number)
      row_count = increase_row(row_count, col_count)
      col_count = increase_col(row_count, col_count)
      box_count = get_box(row_count, col_count)
    end

  end

  def solve!
    @new_info = true
    loop_count = 0
    while true do
      loop_count = loop_count+1
      if not new_info
        puts "can't be solved  (by us) :("
        break
      elsif solved?
        puts "YAY we solved it"
        puts loop_count
        break
      else
        @new_info = false
        board.each do |square|
          eliminate_options(rows, square.possible_options, square) if square.known != 0
          eliminate_options(columns, square.possible_options, square) if square.known != 0
          eliminate_options(boxes, square.possible_options, square) if square.known != 0
        end
      end
    end
  end

  def solved?
    board.all?{ |square| square.known != 0 }
  end

  private

  def eliminate_options(groupings, possible_options, square)
    groupings.each_with_index do |known, index|
      possible_options[index] = false if known
      if possible_options.select{ |option| option }.size == 1
        square.set_known(possible_options.first)
        @new_info = true
        break
      end
    end
  end

  def increase_row(row_count, col_count)
    col_count == 8 ? row_count + 1 : row_count
  end

  def increase_col(row_count, col_count)
    col_count < 8 ? col_count + 1 : 0
  end

  def get_box(row_count, col_count)
    ((row_count/3)*3) + (col_count/3)
  end
end

class Square
  attr_accessor :possible_options, :known, :row, :column, :box

  def initialize(row, col, box, number)
    @possible_options = 9.times.collect{ true }
    @row = row
    @col = col
    @box = box
    set_known(number) if number !=0

  end

  def set_known(number)
    @known = number
    @row[number] = true if number!=0
    @col[number] = true if number!=0
    @box[number] = true if number!=0
  end
end

s = Sudoko.new("619030040270061008000047621486302079000014580031009060005720806320106057160400030")
s.solve!