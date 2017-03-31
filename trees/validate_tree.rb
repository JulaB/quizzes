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
end
