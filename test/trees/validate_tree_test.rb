#!/usr/bin/env ruby
require_relative '../test_helper'
require 'trees/validate_tree'

describe BinaryTreeV do
  it 'returns true for empty tree' do
    assert_equal true, BinaryTreeV.new.valid_bst?
  end

  it 'returns true for one-elemented binary tree' do
    assert_equal true, BinaryTreeV.new([3]).valid_bst?
  end

  it 'returns true for bst' do
    b = BinaryTreeV.new([4, 2, 6, 1, 3, 5, 7])
    assert_equal true, b.valid_bst?
  end

  it 'returns false for non-bst' do
    b = BinaryTreeV.new([4, 12, 10])
    assert_equal false, b.valid_bst?
  end
end
