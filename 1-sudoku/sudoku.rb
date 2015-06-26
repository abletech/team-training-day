class Sudoku
  def initialize(string_grid)
    @string_grid = string_grid
    @grid = string_to_array(@string_grid)
  end

  def solved
    !array_to_string(@grid).include? '0'
  end

  def string_to_array(str)
    str.split('').each_slice(9).to_a
  end

  def array_to_string(array)
    array.flatten.join
  end

  def numbers_from_square_coordinates(x, y)
    numbers = []
    ((y * 3)..(y * 3 + 2)).each do |new_y|
      ((x * 3)..(x * 3 + 2)).each do |new_x|
        numbers.push @grid[new_y][new_x]
      end
    end
    numbers
  end

  def square_coordinates(x, y)
    [x / 3, y / 3]
  end

  def same_number_in_square?(x, y, guess)
    numbers_from_square_coordinates(*square_coordinates(x, y)).include? guess
  end

  def board
    @grid.inspect
  end

  def solve!
    while !solved
      @new_grid = @grid
      @grid.each_with_index do |line, y|
        line.each_with_index do |number, x|
          if number == '0'
            possibilities = []
            (1..9).each do |guess|
              guess = guess.to_s
              if !same_number_in_square?(x, y, guess) && !line.include?(guess) && !@grid.transpose[y].include?(guess)
                possibilities.push guess
              end
            end
            if possibilities.length == 1
              @new_grid[y][x] = possibilities.first
            end
          end
        end
      end
      @grid = @new_grid
    end
  end
end


game = Sudoku.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')

game.solve!

puts game.board
