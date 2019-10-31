# frozen_string_literal: true

require './enumerable_methods.rb'

describe 'Enumerable' do
  let(:num_arr) { [3, 4, 2, 1] }
  let(:empty_arr) { [] }
  let(:word_arr) { %w[ant antelope dog zebra] }

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

    context 'If block is not given' do
      it 'returns an enumerator' do
        expect(num_arr.my_each.is_a?(Enumerable)).not_to eql(false)
      end
    end
  end

  describe '#my_each_with_index' do
    context 'If block is given' do
      it 'iterates the given block for each array item using their indexes' do
        my_array = []
        original_array = []
        num_arr.my_each_with_index { |item, index| my_array << item + index }
        num_arr.each_with_index { |item, index| original_array << item + index }
        expect(my_array).to eql(original_array)
      end
    end

    context 'If block is not given' do
      it 'returns an enumerator' do
        expect(num_arr.my_each_with_index.is_a?(Enumerable)).not_to eql(false)
      end
    end
  end

  describe '#my_select' do
    context 'If block is given' do
      it 'selects items that fulfil a condition given in the block' do
        my_array = num_arr.my_select { |item| item > 2 }
        original_array = num_arr.select { |item| item > 2 }
        expect(my_array).to eql(original_array)
      end
    end

    context 'If block is not given' do
      it 'returns an enumerator' do
        expect(num_arr.my_select.is_a?(Enumerable)).to eql(true)
      end
    end
  end

  describe '#my_all?' do
    context 'If a class is given' do
      it 'returns true if all items in the array belong to that class' do
        my_result = word_arr.my_all? String
        original_result = word_arr.all? String
        expect(my_result).to eql(original_result)
      end
    end

    context 'If called without an argument or block' do
      it 'returns true' do
        expect(num_arr.my_all?).to eql(true)
      end
    end
  end

  describe '#my_any?' do
    context 'If a class is given' do
      it 'returns true if any item in the array belongs to that class' do
        my_result = word_arr.my_any? Integer
        original_result = word_arr.any? Integer
        expect(my_result).to eql(original_result)
      end
    end

    context 'If called without an argument or block' do
      it 'returns true if any item is true' do
        expect(num_arr.my_any?).not_to eql(false)
      end
    end
  end

  describe '#my_none?' do
    context 'If a block is given' do
      it 'returns true if no item in the array satisfies the condition stated in the block' do
        my_result = word_arr.my_none? {|item| item.length < 4}
        original_result = word_arr.none? {|item| item.length < 4}
        expect(my_result).to eql(original_result)
      end
    end

    context 'If called without an argument or block' do
      it 'returns false if any item is true' do
        expect(num_arr.my_none?).to eql(false)
      end
    end
  end
end
