#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative('palindrome')

class PStringTest < Minitest::Test
  def test_empty_string
    assert_equal '', PString.new('').longest_palindrome
  end

  def test_longest_palindrome
    assert_equal 'bacbcab', PString.new('BBABCBCAB').longest_palindrome
  end

  def test_longest_palindrome_with_punctuation
    assert_equal 'madamimadam', PString.new('Madam, I\'m Adam!').longest_palindrome
  end
end
