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

  def my_all? (classification=nil)
    test = true
    my_each { |item| return false unless yield(item) == true } if block_given?
    my_each {|item| return false unless item.class==classification} if classification.class==Class
    my_each { |item| return false unless item =~ classification } if classification.class == Regexp
    my_each { |item| return false unless item == classification } if [Integer, String].include?(classification.class)
    my_each { |item| return false unless item } if !classification && !block_given?
    test
  end

  def my_any? (classification=nil)
    test = false
    my_each { |item| return true unless yield(item) == false } if block_given?
    my_each {|item| return true unless item.class==classification} if classification.class==Class
    my_each { |item| return true unless item =~ classification } if classification.class == Regexp
    my_each { |item| return true unless item == classification } if [Integer, String].include?(classification.class)
    my_each { |item| return true if item } if !classification && !block_given?
    test
  end

  def my_none? (classification=nil)
    test = true
    my_each { |item| return false if yield(item) == true } if block_given?
    my_each {|item| return false if item.class==classification} if classification.class==Class
    my_each { |item| return false if item =~ classification } if classification.class == Regexp
    my_each { |item| return false if item == classification } if [Integer, String].include?(classification.class)
    my_each { |item| return false if item } if !classification && !block_given?
    test
  end

  def my_count
    return length unless block_given?

    counter = 0
    (0...length).each do |i|
      counter += 1 if yield(self[i]) == true
    end
    counter
  end

end

arr = [4, 2, 1, 8, 4, 1, 0, 8, 5, 7, 5, 5, 4, 5, 3, 4, 4, 4, 7, 8, 5, 2, 6, 8, 4, 4, 1, 7, 6, 8, 5, 4, 6, 1, 5, 8, 2, 7, 1, 8, 1, 1, 0, 4, 5, 7, 0, 3, 4, 3, 6, 3, 1, 4, 2, 3, 8, 8, 5, 4, 0, 8, 1, 6, 7, 2, 6, 4, 6, 1, 6, 4, 7, 6, 0, 7, 8, 4, 0, 2, 3, 3, 6, 0, 1, 1, 5, 4, 6, 1, 7, 7, 8, 5, 8, 0, 4, 1, 7, 5]
false_arr = [nil, false, nil, false]

words = %w[dog door rod blade]

print false_arr.my_none?
print arr.my_none?(Integer)
print words.my_none?(/z/)
words[0] = 'cat'
print words.my_none?('cat')
