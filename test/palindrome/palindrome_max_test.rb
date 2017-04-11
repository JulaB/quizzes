#!/usr/bin/env ruby
require_relative '../test_helper'
require 'palindrome/palindrome'

class PStringTest < Minitest::Test
  def test_empty_string_m
    assert_equal '', PString.new('').longest_palindrome
  end

  def test_longest_palindrome_m
    assert_equal 'bacbcab', PString.new('BBABCBCAB').longest_palindrome
  end

  def test_longest_palindrome_with_punctuation
    assert_equal 'madamimadam', PString.new('Madam, I\'m Adam!').longest_palindrome
  end
end
