require 'spec_helper'

RSpec.describe Solver do
  subject {
    Solver.new(["105802000", "090076405", "200400819", "019007306", "762083090", "000061050", "007600030", "430020501", "600308900"].map {|e| e.split(//).collect {|e| e.to_i}})
  }

  describe '#square' do
    it 'should return the canditates for the first square' do
      candidates = subject.square(1,1)
      expect(candidates).to eq [3,4,6,7,8]
    end

    it 'should return the canditates for the last square' do
      candidates = subject.square(2,2)
      expect(candidates).to eq [3,4,6,7,8]
    end

    it 'should return the canditates for 7,7' do
      candidates = subject.square(7,7)
      expect(candidates).to eq [2, 4, 6, 7, 8]
    end
  end

  describe '#column' do
    it 'should return the column 4' do
      candidates = subject.column(4)
      expect(candidates).to eq [1, 3, 4, 5, 9]
    end
  end

  describe '#row' do
    it 'should return the row 4' do
      candidates = subject.row(4)
      expect(candidates).to eq [1, 4, 5]
    end
  end

  describe '#iteration' do
    it 'should run once' do
      expect(subject.iteration).to be_truthy
    end
  end

end
