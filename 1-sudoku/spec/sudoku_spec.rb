require 'spec_helper'

RSpec.describe Sudoku do

  describe 'initialize' do
    let(:sample) { '105802000090076405200400819019007306762083090000061050007600030430020501600308900' }
    it "" do
      game = Sudoku.new(sample)
      game.solve!
      puts game.board
    end
  end

  describe '#row_for_cell' do
    it 'should return the row of the given cell';
  end

  describe '#column_for_cell' do
    it 'should return the column of the given cell';
  end

  describe '#square_for_cell' do
    it 'should return the cells in the square for the given cell';
  end

  describe '#valid_game?' do
    it 'should determine if the sudoku board is valid or not';
  end

end
