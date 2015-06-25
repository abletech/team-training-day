class Cell

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def <=>(other_cell)
    number <=> other_cell.number
  end

end

class EmptyCell < Cell
end

class StartingCell < Cell
end

class AnswerCell < Cell
end