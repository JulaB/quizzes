#!/usr/bin/env ruby

require_relative '../test_helper'
require 'stack/expression'

describe Expression do
  it 'raises error if string is empty' do
    err = assert_raises(ArgumentError) { Expression.new('').evaluate }
    assert_match(/empty/, err.message)
  end

  it 'raises error if expression is incorrect' do
    err = assert_raises(ArgumentError) { Expression.new('a+b{').evaluate }
    assert_match(/only numbers/i, err.message)
  end

  it 'raises error if expression has unclosed parentheses' do
    err = assert_raises(ArgumentError) { Expression.new('4 + 5 * (6 + 8').evaluate }
    assert_match(/incorrect parentheses/i, err.message)
  end

  it 'raises error if expression has incorrect parentheses' do
    err = assert_raises(ArgumentError) { Expression.new('4 + 5 * 6 ) + 8').evaluate }
    assert_match(/incorrect parentheses/i, err.message)
  end

  it 'raises error for incorrect expression' do
    err = assert_raises(ArgumentError) { Expression.new('4+5*').evaluate }
    assert_match(/invalid expression/i, err.message)
  end

  it 'evaluates expression' do
    expr = '19 + 12 / 4 - ((4 - 7) * 3 / 1) '
    assert_equal 31, Expression.new(expr).evaluate
  end

  it 'evaluates expression' do
    expr = '1 + (2 - 3) * 4 + 5 - 6 * 8 - (18 * 12 * 13) - (11 / (5 + 2 + 4)) '
    assert_equal(-2855, Expression.new(expr).evaluate)
  end

  it 'evaluates expression' do
    expr = '((2 + 4) / 3 - 2 + 1) '
    assert_equal 1, Expression.new(expr).evaluate
  end

  it 'evaluates expression with power operation' do
    expr = '5+2^3^2'
    assert_equal 69, Expression.new(expr).evaluate
  end
end
