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
end


arr=[4, 2, 1, 8, 4, 1, 0, 8, 5, 7, 5, 5, 4, 5, 3, 4, 4, 4, 7, 8, 5, 2, 6, 8, 4, 4, 1, 7, 6, 8, 5, 4, 6, 1, 5, 8, 2, 7, 1, 8, 1, 1, 0, 4, 5, 7, 0, 3, 4, 3, 6, 3, 1, 4, 2, 3, 8, 8, 5, 4, 0, 8, 1, 6, 7, 2, 6, 4, 6, 1, 6, 4, 7, 6, 0, 7, 8, 4, 0, 2, 3, 3, 6, 0, 1, 1, 5, 4, 6, 1, 7, 7, 8, 5, 8, 0, 4, 1, 7, 5]
co =arr.my_each_with_index do |x , i|
   print x+1
end
print co
