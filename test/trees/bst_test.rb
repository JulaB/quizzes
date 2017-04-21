#!/usr/bin/env ruby
require_relative '../test_helper'
require 'trees/bst'

describe BSTree do
  let(:b) { BSTree.new.build_from_sorted_a([1, 3, 4, 5, 6, 7, 8, 9]) }
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

  describe '#build_from_preorder_a' do
    it 'retrurns empty tree for empty array' do
      b = BSTree.new
      b.build_from_preorder_a

      assert_equal true, b.empty?
    end

    it 'builds bst from preorder array' do
      arr = [10, 6, 3, 2, 5, 20, 15, 25, 40]
      b = BSTree.new
      b.build_from_preorder_a(arr)

      assert_equal [2, 3, 5, 6, 10, 15, 20, 25, 40], b.to_inorder_a
    end
  end

  describe '#search' do
    it 'returns nil if key is not found' do
      assert_nil b.search(2)
    end

    it 'returns searched element' do
      assert_equal 3, b.search(3).data
    end
  end

  describe '#min' do
    it 'returns nil for empty tree' do
      assert_nil BSTree.new.min
    end

    it 'returns min for only one element in tree' do
      b = BSTree.new.build_from_sorted_a([1])
      assert_equal 1, b.min.data
    end

    it 'returns min value' do
      assert_equal 1, b.min.data
    end
  end

  describe '#max' do
    it 'returns nil for empty tree' do
      assert_nil BSTree.new.max
    end

    it 'returns max for only one element in tree' do
      b = BSTree.new.build_from_sorted_a([1])
      assert_equal 1, b.max.data
    end

    it 'returns max value' do
      assert_equal 9, b.max.data
    end
  end

  describe '#successor' do
    it 'returns successor' do
      assert_nil b.successor(b.search(9))
      assert_equal 9, b.successor(b.search(8)).data
      assert_equal 5, b.successor(b.search(4)).data
    end
  end

  describe '#predecessor' do
    it 'returns predecessor' do
      assert_nil b.predecessor(b.search(1))
      assert_equal 1, b.predecessor(b.search(3)).data
      assert_equal 5, b.predecessor(b.search(6)).data
    end
  end

end
