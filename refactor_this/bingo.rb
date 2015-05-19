class Bingo

  attr_accessor :board, :letters, :finished

  def initialize(board)
    @board = board
    @letters = "BINGO".split("")
    @finished = false
  end

  def new_ticket
    {letter: @letters.sample, number: rand(1..100)}
  end

  def column(letter)
    @board.transpose[@letters.index(letter)]
  end

  def mark!(ticket)
    letter = ticket[:letter]
    number = ticket[:number]
    current_column = column(letter)
    if current_column.include?(number)
      @board[current_column.index(number)][@letters.index(letter)] = "X"
    end
  end

  def check_up!
    @board.transpose.each do |col|
      if col.all? { |i| i == "X" }
        @finished = true
        break
      end
    end
  end

  def check_accross!
    @board.each do |row|
      if row.all? { |i| i == "X" }
        @finished = true
        break
      end
    end
  end

  def check_sideways!
    diagonal = []
    5.times do |i|
      diagonal << @board[i][i]
    end
    if diagonal.all? { |i| i == "X" }
      @finished = true
    end
    other_diagonal = []
    5.times do |i|
      other_diagonal << @board[i][4-i]
    end
    if other_diagonal.all? { |i| i == "X" }
      @finished = true
    end
  end

  def print_board
    system('clear')
    @board.each do |row|
      row.each { |number| print number.to_s.ljust(4) }
      puts
    end
  end
end