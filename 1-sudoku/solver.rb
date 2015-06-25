class Solver
  def initialize(grid)
    @grid = grid
  end

  def solve!
    begin
      ret = iteration
      puts @grid.each_with_index {|l,i| puts '-' * 11 if i % 3 == 0; puts "#{l[0..2]}|#{l[3..5]}|#{l[6..8]}"}
    end while !ret
  end

  def iteration
    found_all = true
    (0..8).to_a.each do |r|
      (0..8).to_a.each do |c|
        if @grid[r][c].to_i == 0
          candidates = (1..9).to_a
          candidates -= square(r,c)
          candidates -= column(c)
          candidates -= row(r)
          # if only 1 candidate - set the value
          if candidates.size == 1
            @grid[r][c] = candidates.first.to_i
          else
            found_all = false
          end
        end
      end
    end
    found_all
  end

  # returns array of all possible numbers for the square
  def square(r,c)
    candidates = (1..9).to_a

    grid_r_segment = r / 3
    grid_c_segment = c / 3
    ((grid_r_segment*3)..(grid_r_segment*3 + 2)).to_a.each {|row|
      ((grid_c_segment*3)..(grid_c_segment*3 + 2)).to_a.each {|col|
        candidates.delete(@grid[row][col].to_i)
      }
    }
    candidates
  end

  def column(c)
    candidates = (1..9).to_a
    @grid.each do |row|
      candidates.delete(row[c].to_i)
    end
    candidates
  end

  def row(r)
    candidates = (1..9).to_a
    @grid[r].each do |val|
      candidates.delete(val.to_i)
    end
    candidates
  end

end
