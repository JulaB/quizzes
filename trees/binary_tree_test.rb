#!/usr/bin/env ruby
gem 'minitest'
require 'minitest/autorun'
require_relative 'binary_tree'

describe BinaryTree do
  describe 'preorder travelsal' do
    it 'returns empty array if tree is empty' do
      assert_equal [], BinaryTree.new.to_preorder_a
    end

    it 'returns correct preorder array' do
      b = BinaryTree.new([1, 2, 3, 4, 5, 6, 7, 8])
      assert_equal [1, 2, 4, 8, 5, 3, 6, 7], b.to_preorder_a
    end
  end

  describe 'inorder travelsal' do
    it 'returns empty array for empty tree' do
      assert_equal [], BinaryTree.new.to_inorder_a
    end

    it 'returns correct inorder array' do
      b = BinaryTree.new([1, 2, 3, 4, 5, 6, 7, 8])
      assert_equal [8, 4, 2, 5, 1, 6, 3, 7], b.to_inorder_a
    end
  end

  describe 'postorder travelsal' do
    it 'returns empty array for empty tree' do
      assert_equal [], BinaryTree.new.to_postorder_a
    end

    it 'returns correct postorder array' do
      b = BinaryTree.new([1, 2, 3, 4, 5, 6, 7, 8])
      assert_equal [8, 4, 5, 2, 6, 7, 3, 1], b.to_postorder_a
    end
  end

  describe 'level order travelsal' do
    it 'returns empty array for empty tree' do
      assert_equal [], BinaryTree.new.to_level_a
    end

    it 'returns level ordered array' do
      b = BinaryTree.new([1, 2, 3, 4, 5, 6, 7, 8])
      assert_equal [1, 2, 3, 4, 5, 6, 7, 8], b.to_level_a
    end
  end

  describe 'vertical order traversal' do
    it 'returns empty array for empty tree' do
      assert_equal [], BinaryTree.new.to_vertical_a
    end

    it 'returns vertical ordered array' do
      b = BinaryTree.new([1, 2, 3, 4, 5, 6, 7, 8])
      assert_equal [8, 4, 2, 1, 5, 6, 3, 7], b.to_vertical_a
    end
  end
end
