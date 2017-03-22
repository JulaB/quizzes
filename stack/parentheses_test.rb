#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'parentheses'

describe Parentheses do
  it 'returns true for correct expression' do
    assert_equal true, Parentheses.balanced?('[(5+6)-4]{}{[()()]()}')
  end

  it 'returns true for empty string' do
    assert_equal true, Parentheses.balanced?('')
  end

  it 'returns false for mismatch' do
    assert_equal false, Parentheses.balanced?('[(}]')
  end

  it 'returns false for incorrect expression' do
    assert_equal false, Parentheses.balanced?('[[[]')
  end
end
