require 'spec_helper'

RSpec.describe Sudoku do
  let(:board_string) { "105802000090076405200400819019007306762083090000061050007600030430020501600308900"}
  let(:game) { Sudoku.new(board_string) }

  describe '#row_for_cell' do
    let(:cell) { game.cell_at(Coordinate.new(x: 0, y: 0))}

    it 'should return the row of the given cell' do
      expect(game.row_for_cell(cell).class).to eql(Array)
      expect(game.row_for_cell(cell).map(&:value)).to eql([1,0,5,8,0,2,0,0,0])
    end
  end

  describe '#cell_at' do
    let(:coordinate) { Coordinate.new(x: 0, y: 0) }
    it 'returns the cell at the specified coordinate' do
      expect( game.cell_at(coordinate).class ).to eql(Cell)
      expect( game.cell_at(coordinate).value ).to eql(1)
    end
  end

  describe '#column_for_cell' do
    let(:cell) { game.cell_at(Coordinate.new(x: 0, y: 0))}

    it 'should return the column of the given cell' do
      expect(game.column_for_cell(cell).class).to eql(Array)
      expect(game.column_for_cell(cell).map(&:value)).to eql([1, 0, 2, 0, 7, 0, 0, 4, 6])
    end
  end

  describe '#square_for_cell' do
    it 'should return the cells in the square for the given cell';
  end

  describe '#valid_game?' do
    it 'should determine if the sudoku board is valid or not';
  end

  describe '#board' do
    subject(:board) { game.board }
    it { expect(board.split("\n").first).to eq('1 0 5 8 0 2 0 0 0')}
    it { expect(board.split("\n").last).to eq('6 0 0 3 0 8 9 0 0')}
  end
end
