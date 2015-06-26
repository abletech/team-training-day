class Bingo
  def initialize(grid_values)
    @letters = "BINGO".chars
    @board = Board.new(grid_values: grid_values, letters: @letters)
  end

  def run
    until board.finished?
      board.mark!(new_ticket)
      board.print_board
      sleep(0.01)
    end
    puts "~* $$$ B-I-N-G-O $$$ *~"
  end

  private

  attr_reader :letters, :board

  def new_ticket
    Ticket.new(letter: letters.sample, number: rand(1..100))
  end
end

class Ticket
  attr_reader :letter, :number
  def initialize(letter:, number:)
    @letter = letter
    @number = number
  end
end

class Board

  def initialize(grid_values:, letters:)
    @grid_values = grid_values
    @letters = letters
  end

  def mark!(ticket)
    current_column = column(ticket.letter)
    if row_num = current_column.index(ticket.number)
      @grid_values[row_num][letters.index(ticket.letter)] = "X"
    end
  end

  def finished?
    return check_up || check_across || check_diagonal
  end

  def print_board
    system('clear')
    @grid_values.each do |row|
      row.each { |number| print number.to_s.ljust(4) }
      puts
    end
  end

  private

  attr_reader :letters

  def column(letter)
    @grid_values.transpose[letters.index(letter)]
  end

  def check_up
    @grid_values.transpose.each do |col|
      if col.all? { |i| i == "X" }
        return true
      end
    end
    false
  end

  def check_across
    @grid_values.each do |row|
      if row.all? { |i| i == "X" }
        return true
      end
    end
    false
  end

  def check_diagonal
    diagonal = []
    other_diagonal = []
    5.times do |i|
      diagonal << @grid_values[i][i]
      other_diagonal << @grid_values[i][4-i]
    end
    if diagonal.all? { |i| i == "X" } || other_diagonal.all? { |i| i == "X" }
      return true
    end
    false
  end

end
