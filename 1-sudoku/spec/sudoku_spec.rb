require 'spec_helper'

RSpec.describe Sudoku do

  sudoku = Sudoku.new("609238745274561398853947621486352179792614583531879264945723816328196457167485932")

  describe '#row_for_cell' do
    let(:cell) { Cell.new(x:0, y:0) }

    subject { sudoku.row_for_cell(cell) }

    it 'should return the row of the given cell' do
      expect(subject).to eq ["6", "0", "9", "2", "3", "8", "7", "4", "5"]
    end
  end

  describe '#column_for_cell' do
    let(:cell) { Cell.new(x:3, y:5) }

    subject { sudoku.column_for_cell(cell) }

    it 'should return the column of the given cell' do
      expect(subject).to eq ["2", "5", "9", "3", "6", "8", "7", "1", "4"]
    end
  end

  describe '#square_for_cell' do
    let(:cell) { Cell.new(x:7, y:7) }

    subject { sudoku.square_for_cell(cell) }
    it 'should return the cells in the square for the given cell' do
      expect(subject).to eq ["8", "1", "6", "4", "5", "7", "9", "3", "2"]
    end
  end

  describe '#valid_game?' do
    it 'should determine if the sudoku board is valid or not';
  end

end
