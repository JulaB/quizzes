#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'palindrome'

class PStringTest < Minitest::Test
  def test_empty_string
    assert_equal true, PString.new('').palindrome_r?
  end

  def test_one_letter_string
    assert_equal true, PString.new('j').palindrome_r?
  end

  def test_non_palindrome
    assert_equal false, PString.new('test').palindrome_r?
  end

  def test_short_palindrome
    assert_equal true, PString.new('madam').palindrome_r?
  end

  def test_ignore_capital_letters
    assert_equal true, PString.new('Wow').palindrome_r?
  end

  def test_ignore_punctuation
    assert_equal true, PString.new('Madam, I\'m Adam!').palindrome_r?
  end

  def test_numbers
    assert_equal true, PString.new('123454321').palindrome_r?
  end
end
