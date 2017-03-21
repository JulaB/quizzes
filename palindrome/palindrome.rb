#!/usr/bin/env ruby
class PString < String
  def initialize(str = '')
    super
    self[0..-1] = downcase.gsub(/[^0-9a-z]/, '')
  end

  def palindrome?
    n = length
    return true if n <= 1

    0.upto(n / 2) { |i| return false unless self[i] == self[-i - 1] }

    true
  end

  def palindrome_r?
    self.class.palindrome_r?(self)
  end

  # return longest palindrome
  def longest_palindrome
    return '' if empty?
    self.class.longest_palindrome(self, 0, length - 1)
  end

  private

  # Recursive version
  def self.palindrome_r?(str)
    return true if str.length <= 1
    str[0] == str[-1] && palindrome_r?(str[1..-2])
  end

  def self.longest_palindrome(str, i, j)
    return str[i] if j == i
    return str[i..j] if i + 1 == j

    return str[i] + longest_palindrome(str, i + 1, j - 1) + str[j] if str[i] == str[j]

    left_palindrome = longest_palindrome(str, i, j - 1)
    right_palindrome = longest_palindrome(str, i + 1, j)

    if left_palindrome.length > right_palindrome.length
      left_palindrome
    else
      right_palindrome
    end
  end
end
