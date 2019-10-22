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
  
    def my_map(&my_proc)
      i = 0
      result = []
      while i < length
        answer = my_proc.call(self[i])
        result << answer
        i += 1
      end
      result
    end
  
    def my_inject(*_initial)
      i = 0
      top = self[i]
      while i < length - 1
        result = yield(top, self[i + 1])
        top = result
        i += 1
      end
      result
    end
  end