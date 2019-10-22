# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    i = 0
    result = []
    while i < length
      answer = yield(self[i])
      result << self[i] unless answer == false
      i += 1
    end
    result
  end

  def my_all?
    test = true
    return test unless block_given?

    (0...length).each do |i|
      test = false if yield(self[i]) == false
      break if test == false
    end
    test
  end
end

arr = [4, 2, 1, 8, 4, 1, 0, 8, 5, 7, 5, 5, 4, 5, 3, 4, 4, 4, 7, 8, 5, 2, 6, 8, 4, 4, 1, 7, 6, 8, 5, 4, 6, 1, 5, 8, 2, 7, 1, 8, 1, 1, 0, 4, 5, 7, 0, 3, 4, 3, 6, 3, 1, 4, 2, 3, 8, 8, 5, 4, 0, 8, 1, 6, 7, 2, 6, 4, 6, 1, 6, 4, 7, 6, 0, 7, 8, 4, 0, 2, 3, 3, 6, 0, 1, 1, 5, 4, 6, 1, 7, 7, 8, 5, 8, 0, 4, 1, 7, 5]
true_array = [1, true, 'hi', []]
print true_array.my_all?
