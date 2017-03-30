#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'invert_binary_tree'

describe BinaryTreeInv do
  it 'inverts empty tree' do
    assert_equal [], BinaryTreeInv.new.invert.to_inorder_a
  end

  it 'inverts one-elemneted tree' do
    b = BinaryTreeInv.new([1])
    assert_equal [1], b.invert.to_inorder_a
  end

  it 'inverts tree' do
    b = BinaryTreeInv.new([1, 2, 3, 4, 5, 6, 7, 8])
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], b.to_level_a
    assert_equal [1, 3, 2, 7, 6, 5, 4, 8], b.invert.to_level_a
  end
end
