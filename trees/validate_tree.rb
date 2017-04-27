#!/usr/bin/env ruby
require_relative 'binary_tree'

class BinaryTreeV < BinaryTree
  def valid_bst?
    arr = to_inorder_a
    n = arr.length

    for i in (0...n - 1)
      return false if arr[i] > arr[i + 1]
    end

    true
  end

  def valid_bst_r?
    valid_bst_helper(@root, -Float::INFINITY, Float::INFINITY)
  end

  private

  def valid_bst_helper(root, min, max)
    return true if root.nil?

    return false unless root.data.between?(min, max)

    valid_left = valid_bst_helper(root.left, min, root.data - 1)
    valid_left && valid_bst_helper(root.rigth, root.data + 1, max)
  end
end
