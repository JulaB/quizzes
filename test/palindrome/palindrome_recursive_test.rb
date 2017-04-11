#!/usr/bin/env ruby
require_relative '../test_helper'
require 'palindrome/palindrome'

class PStringTest < Minitest::Test
  def test_empty_string_r
    assert_equal true, PString.new('').palindrome_r?
  end

  def test_one_letter_string_r
    assert_equal true, PString.new('j').palindrome_r?
  end

  def test_non_palindrome_r
    assert_equal false, PString.new('test').palindrome_r?
  end

  def test_short_palindrome_r
    assert_equal true, PString.new('madam').palindrome_r?
  end

  def test_ignore_capital_letters_r
    assert_equal true, PString.new('Wow').palindrome_r?
  end

  def test_ignore_punctuation_r
    assert_equal true, PString.new('Madam, I\'m Adam!').palindrome_r?
  end

  def test_numbers_r
    assert_equal true, PString.new('123454321').palindrome_r?
  end
end
