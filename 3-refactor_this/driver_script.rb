require_relative './bingo.rb'

sample_board = [[47, 44, 71, 8, 88],
                [22, 69, 75, 65, 73],
                [83, 85, 97, 89, 57],
                [25, 31, 96, 68, 51],
                [75, 70, 54, 80, 83]]

bingo = Bingo.new(sample_board)
bingo.run
