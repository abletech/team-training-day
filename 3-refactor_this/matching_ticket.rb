require './ticket'

class MatchingTicket
  def initialize(ticket)
    @ticket = ticket

    @x = Bingo::LETTERS.index(@ticket.letter)
    @y = @ticket.number.index(@board.transpose[@x])
  end
end
