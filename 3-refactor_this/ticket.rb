require './bingo'

class Ticket
  attr_reader :letter, :number

  def initialize
    @letter = Bingo::LETTERS.sample
    @number = rand(1..100)
  end
end
