#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'palindrome'

describe SinglyLListP do
  let(:l) { SinglyLListP.new }
  it 'returns true for empty list' do
    assert_equal true, l.palindrome?
  end

  it 'returns true for one-elemented list' do
    l.insert('1')
    assert_equal true, l.palindrome?
  end

  it 'returns true for palindrome list' do
    l.insert(1).insert(2).insert(3).insert(2).insert(1)
    assert_equal true, l.palindrome?
  end

  it 'returns false for regular list' do
    l.insert(1).insert(2).insert(4).insert(1)
    assert_equal false, l.palindrome?
  end
end
