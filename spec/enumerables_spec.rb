# frozen_string_literal: true

require './enumerable_methods.rb'

describe 'Enumerable' do
  let(:num_arr) { [3, 4, 2, 1] }
  let(:empty_arr) { [] }

  describe '#my_each' do
    context 'If block is given' do
      it 'iterates the given block for each array item' do
        my_array = []
        original_array = []
        num_arr.my_each { |i| my_array << i + 2 }
        num_arr.each { |i| original_array << i + 2 }
        expect(my_array).to eql(original_array)
      end
    end
  end
end
