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
      result << answer if answer != nil
      i += 1
    end
    result
  end
end

arr = [1, 2, 3, 4, 5]
arr.my_each do |num|
  print num * 2
end

arr.my_each_with_index do |num, index|
  print num if index.even?
end

rice = arr.my_select do |num|
  num if num >= 3
end

print rice
