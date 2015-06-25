class BoardParser
  attr_reader :array
  def initialize(char_line)
    @array = char_line.scan(/.{1,9}/m)
    @array.map! {|e| e.split(//).map{|ee| ee.to_i}}
  end

end
