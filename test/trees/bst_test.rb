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

  describe '#insert' do
    it 'inserts new value to left branch BST' do
      b = BSTree.new.build_from_sorted_a([5, 10, 25])
      b.insert(6)
      p_node = b.search(5)

      assert_equal 6, p_node.right.data
      assert_equal p_node, p_node.right.parent
      assert_nil p_node.left
    end
  end

  describe '#delete' do
    let(:b) { BSTree.new.insert(10).insert(5).insert(30).insert(20).insert(35).insert(15).insert(40) }

    it 'deletes node without children' do
      node = b.search(10)
      assert_equal 5, node.left.data
      assert_nil node.left.left
      assert_nil node.left.right

      b.delete(node.left)
      assert_nil node.left
    end

    it 'deletes node with one left child' do
      node = b.search(20)
      p_node = node.parent
      assert_equal 15, node.left.data
      assert_nil node.right

      b.delete(node)
      assert_equal p_node, node.left.parent
      assert_equal p_node.left, node.left
    end

    it 'deletes node with one right child' do
      node = b.search(35)
      p_node = node.parent
      assert_equal 40, node.right.data
      assert_nil node.left

      b.delete(node)
      assert_equal p_node.right, node.right
      assert_equal p_node, node.right.parent
    end


    it 'deletes node with both children' do
      node = b.search(30)
      p_node = node.parent
      r_node = node.right
      refute_nil node.left
      refute_nil node.right

      b.delete(node)
      assert_equal 35, p_node.right.data
      assert_equal r_node.right, p_node.right.right
      assert_equal [5, 10, 15, 20, 35, 40], b.to_inorder_a
    end

    it 'detetes root node' do
      node = b.search(10)
      assert_nil node.parent

      b.delete(node)
      assert_equal 15, node.data
      assert_equal [5, 15, 20, 30, 35, 40], b.to_inorder_a
    end
  end

end
