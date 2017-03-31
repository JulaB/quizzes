#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'bst'

describe BSTree do
  describe '#build_from_sorted_a' do
    it 'returns empty tree for empty array' do
      b = BSTree.new
      b.build_from_sorted_a

      assert_equal true, b.empty?
    end

    it 'builds bst from sorted array' do
      arr = [1, 3, 4, 5, 6, 7, 8, 9]
      b = BSTree.new
      b.build_from_sorted_a(arr)

      assert_equal arr, b.to_inorder_a
    end
  end
end
