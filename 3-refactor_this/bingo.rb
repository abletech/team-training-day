require './board.rb'

class Bingo
  LETTERS = %w(B I N G O)

  attr_accessor :board, :finished

  def initialize(board)
    @board = board
    # @letters = "BINGO".split("") # ['B', 'I', 'N', 'G', 'O']
    @finished = false
  end

  def new_ticket
    {letter: @letters.sample, number: rand(1..100)}
    #{ letter: random letter from 'BINGO', number: random number between 1 and 100 }
  end

  def columnFromLetter(letter)
    # @letters.index(letter) => 0
    @board.transpose[@letters.index(letter)]
    # return the first column if B, second column if I...
  end

  def findPosition(ticket)
    column = columnFromLetter(ticket.letter)

    [LETTERS.index(ticket.letter), column.index(ticket.number)]
  end

  def checkForMatch(ticket)
    letter = ticket.letter
    number = ticket.number

    column = columnFromLetter(ticket.letter)

    column.include?(number)
  end

  def mark!(x, y)
    @board[y][x] = "X"
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
    # for i = 0; i < 5; i++
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
      # should use another name for number (could be X)
      row.each { |number| print number.to_s.ljust(4) }
      puts
    end
  end
end
