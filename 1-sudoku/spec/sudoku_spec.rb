require 'spec_helper'

RSpec.describe Sudoku do

  let(:string){ '619030040270061008000047621486302079000014580031009060005720806320106057160400030' }

  before do
    @sudoku = Sudoku.new(string)
  end

  describe '#row_for_cell' do
    it 'should return the row of the given cell' do
      expect(@sudoku.row_for_cell(0).map(&:number)).to eq [6,1,9,0,3,0,0,4,0]
    end
  end

  describe '#column_for_cell' do
    it 'should return the column of the given cell' do
      expect(@sudoku.column_for_cell(0).map(&:number)).to eq [6,2,0,4,0,0,0,3,1]
    end
  end

  describe '#group_for_cell' do
    it 'should return the cells in the group for the given cell' do
      expect(@sudoku.group_for_cell(0,0).map(&:number)).to eq([6,1,9,2,7,0,0,0,0].sort)
    end
  end

  describe '#valid_game?' do
    context 'when the board is invalid' do
      let(:string){ '619030040270061008000047621486302079000014580031009060005720806320106057160400033' }
      it { expect(@sudoku.board.valid_game?).to eq(false) }
    end

    context 'when the board is invalid' do
      it { expect(@sudoku.board.valid_game?).to eq(true) }
    end
  end

end
