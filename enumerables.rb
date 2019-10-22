# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
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
    (0...length).each do |i|
      test = false if yield(self[i]) == false
      break if test == false
    end
    test
  end

  def my_any?
    test = false
    (0...length).each do |i|
      test = true if yield(self[i]) == true
      break if test == true
    end
    test
  end

  def my_none?
    test = false
    (0...length).each do |i|
      test = true if yield(self[i]) == true
      break if test == true
    end
    !test
  end

  def my_count
    return length unless block_given?

    counter = 0
    (0...length).each do |i|
      counter += 1 if yield(self[i]) == true
    end
    counter
  end

  def my_map
    i = 0
    result = []
    while i < length
      answer = yield(self[i])
      result << answer
      i += 1
    end
    result
  end

end

arr = [1, 2, 3, 4, 5]
rice = arr.select { |i| i >= 3 && i <= 7 }
beans = arr.my_select { |i| i >= 3 && i <= 7 }
dodo=arr.map { |i| i >= 3 && i <= 7 }
stew=arr.my_map { |i| i >= 3 && i <= 7 }
print rice
print beans
print dodo
print stew
